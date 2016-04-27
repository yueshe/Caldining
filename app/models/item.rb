class Item < ActiveRecord::Base
    has_many :servings
    has_many :users, :through => :servings
end
