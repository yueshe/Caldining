# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
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
        :timeframe => "Tomorrow"
        )