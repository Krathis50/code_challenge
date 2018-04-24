require 'rails_helper'

RSpec.describe "problem_sets/edit", type: :view do
  before(:each) do
    @problem_set = assign(:problem_set, ProblemSet.create!(
      :arguments => "MyString",
      :text, => "MyString",
      :answer => "MyString",
      :text, => "MyString",
      :challenge => nil
    ))
  end

  it "renders the edit problem_set form" do
    render

    assert_select "form[action=?][method=?]", problem_set_path(@problem_set), "post" do

      assert_select "input[name=?]", "problem_set[arguments]"

      assert_select "input[name=?]", "problem_set[text,]"

      assert_select "input[name=?]", "problem_set[answer]"

      assert_select "input[name=?]", "problem_set[text,]"

      assert_select "input[name=?]", "problem_set[challenge_id]"
    end
  end
end
