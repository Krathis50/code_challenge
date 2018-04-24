require 'rails_helper'

RSpec.describe "problem_sets/show", type: :view do
  before(:each) do
    @problem_set = assign(:problem_set, ProblemSet.create!(
      :arguments => "Arguments",
      :text, => "Text,",
      :answer => "Answer",
      :text, => "Text,",
      :challenge => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Arguments/)
    expect(rendered).to match(/Text,/)
    expect(rendered).to match(/Answer/)
    expect(rendered).to match(/Text,/)
    expect(rendered).to match(//)
  end
end
