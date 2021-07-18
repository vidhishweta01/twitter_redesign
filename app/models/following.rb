class Following < ApplicationRecord
  belongs_to :user
  belongs_to :followed, class_name: 'User'

  def self.find_following(id1, id2)
    if Following.where(user_id: id1, followed_id: id2).empty?
      Following.where(user_id: id2, followed_id: id1)[0].id
    else
      Following.where(user_id: id1, followed_id: id2)[0].id
    end
  end
end
