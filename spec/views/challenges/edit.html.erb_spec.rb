require 'rails_helper'

RSpec.describe "challenges/edit", type: :view do
  before(:each) do
    @challenge = assign(:challenge, Challenge.create!(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit challenge form" do
    render

    assert_select "form[action=?][method=?]", challenge_path(@challenge), "post" do

      assert_select "input[name=?]", "challenge[name]"

      assert_select "textarea[name=?]", "challenge[description]"
    end
  end
end
