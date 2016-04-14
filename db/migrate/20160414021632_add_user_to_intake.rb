class AddUserToIntake < ActiveRecord::Migration
  def change
    add_reference :intakes, :user, index: true, foreign_key: true
  end
end
