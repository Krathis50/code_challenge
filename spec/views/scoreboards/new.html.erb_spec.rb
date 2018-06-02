require 'rails_helper'

RSpec.describe "scoreboards/new", type: :view do
  before(:each) do
    assign(:scoreboard, Scoreboard.new())
  end

  it "renders new scoreboard form" do
    render

    assert_select "form[action=?][method=?]", scoreboards_path, "post" do
    end
  end
end
