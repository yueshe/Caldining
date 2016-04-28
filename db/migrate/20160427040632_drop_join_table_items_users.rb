class DropJoinTableItemsUsers < ActiveRecord::Migration
  def change
    drop_table :items_users
  end
end
