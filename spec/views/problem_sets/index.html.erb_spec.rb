require 'rails_helper'

RSpec.describe "problem_sets/index", type: :view do
  before(:each) do
    assign(:problem_sets, [
      ProblemSet.create!(
        :arguments => "Arguments",
        :text, => "Text,",
        :answer => "Answer",
        :text, => "Text,",
        :challenge => nil
      ),
      ProblemSet.create!(
        :arguments => "Arguments",
        :text, => "Text,",
        :answer => "Answer",
        :text, => "Text,",
        :challenge => nil
      )
    ])
  end

  it "renders a list of problem_sets" do
    render
    assert_select "tr>td", :text => "Arguments".to_s, :count => 2
    assert_select "tr>td", :text => "Text,".to_s, :count => 2
    assert_select "tr>td", :text => "Answer".to_s, :count => 2
    assert_select "tr>td", :text => "Text,".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
