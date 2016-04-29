
Given /^I am logged in$/ do
  visit 'users/sign_up'
  fill_in 'Email', :with => 'aaaaaa@gmail.com'
  fill_in 'Password', :with => 'aaaaaaaa'
  fill_in 'Password confirmation', :with => 'aaaaaaaa'
  click_button("Sign up")
end

Given /the database is setup/ do
  halls = [{:name => 'Cafe 3'},
    	  {:name => 'CKC'},
    	  {:name => 'Crossroads'},
    	  {:name => 'Foothill'},
  	 ]

  halls.each do |hall|
    Hall.find_or_create_by(hall)
  end
  
  Item.find_or_create_by(:name => 'French Fries',
        :calories => 100,
        :fat => 10,
        :carb => 10,
        :cholesterol => 0,
        :protein => 0,
        :sodium => 100,
        :location => "Crossroads",
        :date => Date.current,
        :mealtime => "Breakfast"
        )
end  

Given /I am the admin/ do
  @user = User.find(1)
  @user.update_attribute(:admin, true)
end
