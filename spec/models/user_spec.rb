require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(username: 'Anything', email: 'Lorem ipsum', password: '123456') }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without username ' do
    subject.username = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without email ' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end
end
