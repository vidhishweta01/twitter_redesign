class AddForiegnKey < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :tweet, :user
  end
end
