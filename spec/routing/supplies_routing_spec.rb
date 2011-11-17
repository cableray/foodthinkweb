require "spec_helper"

describe SuppliesController do
  describe "routing" do

    it "routes to #index" do
      get("/supplies").should route_to("supplies#index")
    end

    it "routes to #new" do
      get("/supplies/new").should route_to("supplies#new")
    end

    it "routes to #show" do
      get("/supplies/1").should route_to("supplies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/supplies/1/edit").should route_to("supplies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/supplies").should route_to("supplies#create")
    end

    it "routes to #update" do
      put("/supplies/1").should route_to("supplies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/supplies/1").should route_to("supplies#destroy", :id => "1")
    end

  end
end
