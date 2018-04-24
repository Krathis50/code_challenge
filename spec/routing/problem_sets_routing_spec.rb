require "rails_helper"

RSpec.describe ProblemSetsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/problem_sets").to route_to("problem_sets#index")
    end

    it "routes to #new" do
      expect(:get => "/problem_sets/new").to route_to("problem_sets#new")
    end

    it "routes to #show" do
      expect(:get => "/problem_sets/1").to route_to("problem_sets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/problem_sets/1/edit").to route_to("problem_sets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/problem_sets").to route_to("problem_sets#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/problem_sets/1").to route_to("problem_sets#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/problem_sets/1").to route_to("problem_sets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/problem_sets/1").to route_to("problem_sets#destroy", :id => "1")
    end

  end
end
