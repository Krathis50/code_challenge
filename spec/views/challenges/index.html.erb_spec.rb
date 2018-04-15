require 'rails_helper'

RSpec.describe "challenges/index", type: :view do
  before(:each) do
    assign(:challenges, [
      Challenge.create!(
        :name => "Name",
        :description => "MyText"
      ),
      Challenge.create!(
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of challenges" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
