#adapted from https://github.com/veersuvrat/CalDining-169/blob/master/app/workers/parser_worker.rb
require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'sidekiq'

class ParserWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable
  recurrence backfill: true do
    daily.hour_of_day(10)
  end
  
  def perform
    @base_url = "http://services.housing.berkeley.edu/FoodPro/dining/static/"
    @menu_path = "todaysentrees.asp"
    doc = Nokogiri::HTML(open(@base_url + @menu_path))
    
    breakfast_data = doc.css("td").select{|candidate| candidate.css("b").text == "Breakfast"}
    lunch_data = [doc.css("td").select{|candidate| candidate.css("b").text == "Lunch"}[0],
                doc.css("td").select{|candidate| candidate.css("b").text == "Brunch"}[0],
                doc.css("td").select{|candidate| candidate.css("b").text == "Lunch/Brunch"}[0],
                doc.css("td").select{|candidate| candidate.css("b").text == "Lunch"}[1]]
    dinner_data = doc.css("td").select{|candidate| candidate.css("b").text == "Dinner"}
    
    meals = {"Breakfast" => breakfast_data, "Lunch/Brunch" => lunch_data, "Dinner" => dinner_data}
    
    # USE AND MODIFY only these variables for relative postioning of locations on the website.
    positions = {"Crossroads" => 0, "Cafe 3" => 1, "Foothill" => 2, "Clark Kerr" => 3}
    
    # Clear each item's list of menus, and each menu's list of items
    Item.where(:date => 3.months.ago).each do |item|
      item.clear
      item.save
    end
    
    # Populate each submenu with its meal items
    meals.keys.each do |meal_name|
      positions.keys.each do |location_name|
        meal = meals[meal_name]
        index = positions[location_name]
        submenu_data = meal[index]
        get_submenu_items(submenu_data, location_name, meal_name)
      end
    end
  end
  
  # Input: submenu nokogiri object (e.g. Breakfast at Crossroads object), submenu record object
  # Output: ARRAY of created or updated Item objects
  # If a location is closed for the particular meal time, you will get back an EMPTY RUBY ARRAY.
  def get_submenu_items(submenu_data, location_name, meal_name)
      items = []
  
      submenu_data.css("a").each do |item|
      item_url = @base_url + item.attributes["href"].value
      item_doc = Nokogiri::HTML(open(item_url))
      
      # NOTE: currently, we always update existing item records; maybe allow skipping in future?
      curr_item = Item.find_or_create_by(name: item.text, location: location_name, date: Date.current, mealtime: meal_name)
    
      # Check nutrition availability. If unavailable, add to items and skip to next iter.
      if item_doc.css("font").select{|candidate| candidate.css("i").text =~ /^Nutritional Information is not available/}.empty?
        curr_item.nutrition_available = true
      else
        #curr_item.nutrition_available = false
        curr_item.save
        curr_item.touch
        next
      end
  
      c_match = item_doc.css("font").find{|candidate| candidate.css("b").text =~ /^Calories/}.text.match(/^Calories.(\d*)/)
      curr_item.calories = c_match[1] if c_match
  
      cff_match = item_doc.css("font").find{|candidate| candidate.text =~ /Calories from/}.text.match(/Calories from Fat.(\d*)/)
      curr_item.calories_from_fat = cff_match[1] if cff_match
  
      tf_text = item_doc.css("font").find{|candidate| candidate.css("b").text =~ /^Total/}.next.text
      curr_item.fat = tf_text if tf_text
      #curr_item.total_fat_percent = (curr_item.total_fat[0..-2].to_f / 65 * 100).round.to_s if tf_text
  
      tc_text = item_doc.css("font").find{|candidate| candidate.css("b").text =~ /^Tot\./}.next.text
      curr_item.carb = tc_text if tc_text
      #curr_item.total_carbohydrates_percent = (curr_item.total_carbohydrates[0..-2].to_f / 300 * 100).round.to_s if tc_text
  
      #sf_text = item_doc.css("font").find{|candidate| candidate.text =~ /Sat\./}.next.text
      #curr_item.saturated_fat = sf_text if sf_text
      #curr_item.saturated_fat_percent = (curr_item.saturated_fat[0..-2].to_f / 20 * 100).round.to_s if sf_text
  
      #df_text = item_doc.css("font").find{|candidate| candidate.text =~ /Dietary/}.next.text
      #curr_item.dietary_fiber = df_text if df_text
      #curr_item.dietary_fiber_percent = (curr_item.dietary_fiber[0..-2].to_f / 25 * 100).round.to_s if df_text
  
      #trf_text = item_doc.css("font").find{|candidate| candidate.text =~ /Trans/}.next.text
      #curr_item.trans_fat = trf_text if trf_text
  
      #su_text = item_doc.css("font").find{|candidate| candidate.text =~ /Sugars/}.next.text
      #curr_item.sugars = su_text if su_text
  
      ch_text = item_doc.css("font").find{|candidate| candidate.css("b").text =~ /^Cholesterol/}.next.text
      curr_item.cholesterol = ch_text if ch_text
      #curr_item.cholesterol_percent = (curr_item.cholesterol[0..-3].to_f / 300 * 100).round.to_s if ch_text
  
      p_text = item_doc.css("font").find{|candidate| candidate.css("b").text =~ /^Protein/}.next.text
      curr_item.protein = p_text if p_text
  
      sd_text = item_doc.css("font").find{|candidate| candidate.css("b").text =~ /^Sodium/}.next.text
      curr_item.sodium = sd_text if sd_text
      #curr_item.sodium_percent = (curr_item.sodium[0..-3].to_f / 2400 * 100).round.to_s if sd_text
  
      # Percentage
      #vc_match = item_doc.css("font").find{|candidate| candidate.text =~ /Vitamin C/}.next.next.text.match(/(\d*)%\z/)
      #curr_item.vitamin_c_percent = vc_match[1] if vc_match
  
      # Percentage
      #ca_match = item_doc.css("font").find{|candidate| candidate.text =~ /Calcium/}.next.next.text.match(/(\d*)%\z/)
      #curr_item.calcium_percent = ca_match[1] if ca_match
  
      # Percentage
      #fe_match = item_doc.css("font").find{|candidate| candidate.text =~ /Iron/}.next.next.text.match(/(\d*)%\z/)
      #curr_item.iron_percent = fe_match[1] if fe_match
  
      # Form: single string (looks like list)
      #al_match = item_doc.css("font").find{|candidate| candidate.css("b").text =~ /^ALLERGENS/}.text.tr("\u00A0", " ").match(/ALLERGENS:\s+(.*)/)
      #curr_item.allergens = al_match[1] if al_match
  
      # Form: single string (looks like list)
      #ing_match = item_doc.css("font").find{|candidate| candidate.css("b").text =~ /^INGREDIENTS/}.text.tr("\u00A0", " ").match(/INGREDIENTS:\s+(.*)/)
      #curr_item.ingredients = ing_match[1] if ing_match
    
      curr_item.save
      curr_item.touch
      items << curr_item
    end
  
    return items
  end
end