require 'rails_helper'

RSpec.describe "problem_sets/new", type: :view do
  before(:each) do
    assign(:problem_set, ProblemSet.new(
      :arguments => "MyString",
      :text, => "MyString",
      :answer => "MyString",
      :text, => "MyString",
      :challenge => nil
    ))
  end

  it "renders new problem_set form" do
    render

    assert_select "form[action=?][method=?]", problem_sets_path, "post" do

      assert_select "input[name=?]", "problem_set[arguments]"

      assert_select "input[name=?]", "problem_set[text,]"

      assert_select "input[name=?]", "problem_set[answer]"

      assert_select "input[name=?]", "problem_set[text,]"

      assert_select "input[name=?]", "problem_set[challenge_id]"
    end
  end
end
