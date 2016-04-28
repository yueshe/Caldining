class CreateServings < ActiveRecord::Migration
  def change
    create_table :servings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true
      t.integer :total

      t.timestamps null: false
    end
  end
end
