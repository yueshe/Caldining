class CreateDailyreports < ActiveRecord::Migration
  def change
    create_table :dailyreports do |t|

      t.timestamps null: false
    end
  end
end
