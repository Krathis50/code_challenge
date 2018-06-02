require 'rails_helper'

RSpec.describe "scoreboards/index", type: :view do
  before(:each) do
    assign(:scoreboards, [
      Scoreboard.create!(),
      Scoreboard.create!()
    ])
  end

  it "renders a list of scoreboards" do
    render
  end
end
