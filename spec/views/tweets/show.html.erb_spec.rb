require 'rails_helper'

RSpec.describe "tweets/show", type: :view do
  before(:each) do
    @tweet = assign(:tweet, Tweet.create!(
      content: "MyText",
      user_id: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
