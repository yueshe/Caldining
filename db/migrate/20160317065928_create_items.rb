class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :calories
      t.decimal :fat
      t.decimal :carb
      t.decimal :cholesterol
      t.decimal :protein
      t.decimal :sodium
      t.string :location
      t.string :timeframe

      t.timestamps null: false
    end
  end
end
