class CreateIntakes < ActiveRecord::Migration
  def change
    create_table :intakes do |t|
      t.datetime :date
      t.string :meal
      t.decimal :calories
      t.decimal :fat
      t.decimal :carb
      t.decimal :cholesterol
      t.decimal :protein
      t.decimal :sodium

      t.timestamps null: false
    end
  end
end
