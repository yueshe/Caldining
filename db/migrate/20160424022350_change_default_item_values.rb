class ChangeDefaultItemValues < ActiveRecord::Migration
  def change
    change_column_default :items, :calories_from_fat, 0
    change_column_default :items, :fat, 0.0
    change_column_default :items, :carb, 0.0
    change_column_default :items, :cholesterol, 0.0
    change_column_default :items, :protein, 0.0
    change_column_default :items, :sodium, 0.0
    rename_column :items, :timeframe, :date
  end
end
