require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { described_class.new(user_id: 4, tweet_id: 11) }

  it 'is not valid without a user' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a tweet' do
    subject.tweet_id = nil
    expect(subject).to_not be_valid
  end
end
