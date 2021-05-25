class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_one_attached :image
  has_many :followers, class_name: 'Following', foreign_key: 'follower_id'
  has_many :followings, foreign_key: 'following_id'
  has_many :tweets

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: '150X190!').processed
    else
      '/default_profile.jpg'
    end
  end

  def image_cover
    if image.attached?
      image
    else
      '/default_profile.jpg'
    end
  end

  def followers(user)
    Following.where(followed_id: user.id).count
  end

  def following(user)
    Following.where(user_id: user.id).count
  end

  def suggestions(user)
    User.where.not(id: user.id)
  end

  def followed_by(user)
    ids = Following.where(followed_id: user.id).limit(4).pluck(:user_id)
    User.where(id: ids)
  end

  def already_followed?(id1, id2)
    !Following.where(user_id: id1, followed_id: id2).empty?
  end

  def follow(user)
    Following.create(followed_id: user.id)
  end

  private

  def add_default_avatar
    unless avatar.attached? # rubocop:disable Style/GuardClause
      avatar.attach(
        io: File.open(
          Rails.root.join('app', 'assets', 'images', 'https://drive.google.com/file/d/1S2OsWmz5nHQuWcPu-KJvpRDIpUz1--oa/view?usp=sharing')
        ), filename: 'default_profile.jpg',
        content_type: 'image/jpg '
      )
    end
  end

  def add_default_cover
    unless image.attached? # rubocop:disable Style/GuardClause
      image.attach(
        io: File.open(
          Rails.root.join('app', 'assets', 'images', 'https://drive.google.com/file/d/1S2OsWmz5nHQuWcPu-KJvpRDIpUz1--oa/view?usp=sharing')
        ), filename: 'default_profile.jpg',
        content_type: 'image/jpg '
      )
    end
  end
end
