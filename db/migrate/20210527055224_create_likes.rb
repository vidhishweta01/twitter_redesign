class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :tweet_id
    end
    add_foreign_key :likes, :users, column: :user_id
    add_foreign_key :likes, :tweets, column: :tweet_id
  end
end
