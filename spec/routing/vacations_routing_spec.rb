require "rails_helper"

RSpec.describe VacationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/vacations").to route_to("vacations#index")
    end


    it "routes to #show" do
      expect(:get => "/vacations/1").to route_to("vacations#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/vacations").to route_to("vacations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/vacations/1").to route_to("vacations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/vacations/1").to route_to("vacations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/vacations/1").to route_to("vacations#destroy", :id => "1")
    end

  end
end
