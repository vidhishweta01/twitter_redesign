class AddForiegnkey < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :tweets, :users
  end
end
