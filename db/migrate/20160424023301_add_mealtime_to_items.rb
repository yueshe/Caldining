class AddMealtimeToItems < ActiveRecord::Migration
  def change
    add_column :items, :mealtime, :string
  end
end
