class Item < ActiveRecord::Base
    has_many :servings
    has_many :items, :through => :servings
end
