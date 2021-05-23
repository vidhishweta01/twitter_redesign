require 'rails_helper'

RSpec.describe Following, type: :model do
  subject {
    described_class.new(user_id: 4, followed_id: 5)
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a user' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a followed' do
    subject.followed_id = nil
    expect(subject).to_not be_valid
  end
end
