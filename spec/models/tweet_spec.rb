require 'rails_helper'

RSpec.describe Tweet, type: :model do
  subject { described_class.new(content: 'hello world', user_id: 4) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a content' do
    subject.content = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a user_id' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
end
