require 'rails_helper'

RSpec.describe "ProblemSets", type: :request do
  describe "GET /problem_sets" do
    it "works! (now write some real specs)" do
      get problem_sets_path
      expect(response).to have_http_status(200)
    end
  end
end
