class RenameItemsTimeframeToDate < ActiveRecord::Migration
  def change
    rename_column :items, :timeframe, :date
  end
end
