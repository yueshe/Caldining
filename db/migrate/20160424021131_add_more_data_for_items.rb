class AddMoreDataForItems < ActiveRecord::Migration
  def change
    add_column :items, :nutrition_available, :boolean, default: false
    add_column :items, :calories_from_fat, :integer
  end
end
