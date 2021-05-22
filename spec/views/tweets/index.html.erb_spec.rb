require 'rails_helper'

RSpec.describe "tweets/index", type: :view do
  before(:each) do
    assign(:tweets, [
      Tweet.create!(
        content: "MyText",
        user_id: 2
      ),
      Tweet.create!(
        content: "MyText",
        user_id: 2
      )
    ])
  end

  it "renders a list of tweets" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
