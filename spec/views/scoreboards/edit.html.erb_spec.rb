require 'rails_helper'

RSpec.describe "scoreboards/edit", type: :view do
  before(:each) do
    @scoreboard = assign(:scoreboard, Scoreboard.create!())
  end

  it "renders the edit scoreboard form" do
    render

    assert_select "form[action=?][method=?]", scoreboard_path(@scoreboard), "post" do
    end
  end
end
