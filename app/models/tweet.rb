class Tweet < ApplicationRecord
  validates :content, presence: true, length: { maximum: 300,
              too_long: '300 characters in tweet is the maximum allowed.' } # rubocop:disable Layout/HashAlignment
  validates :user_id, presence: true
  belongs_to :user
  has_many :likes, dependent: :destroy
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
