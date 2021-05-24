class Tweet < ApplicationRecord
  validates :content, presence: true, length: { maximum: 1000,
              too_long: '1000 characters in post is the maximum allowed.' } # rubocop:disable Layout/HashAlignment
  validates :user_id, presence: true
  belongs_to :user

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
