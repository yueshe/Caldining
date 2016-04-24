class ChangeDefaultItemValues < ActiveRecord::Migration
  def change
    change_column_default :items, :calories_from_fat, 0
    change_column_default :items, :fat, 0.0
    change_column_default :items, :carb, 0.0
    change_column_default :items, :cholesterol, 0.0
    change_column_default :items, :protein, 0.0
    change_column_default :items, :sodium, 0.0
<<<<<<< HEAD
    change_column :items, :timeframe, :date
=======
    rename_column :items, :timeframe, :date
>>>>>>> 93c1f326659643685425544b80217c3dcdb37bf0
  end
end
