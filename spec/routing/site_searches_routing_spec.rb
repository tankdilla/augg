require "spec_helper"

describe SiteSearchesController do
  describe "routing" do

    it "routes to #index" do
      get("/site_searches").should route_to("site_searches#index")
    end

    it "routes to #new" do
      get("/site_searches/new").should route_to("site_searches#new")
    end

    it "routes to #show" do
      get("/site_searches/1").should route_to("site_searches#show", :id => "1")
    end

    it "routes to #edit" do
      get("/site_searches/1/edit").should route_to("site_searches#edit", :id => "1")
    end

    it "routes to #create" do
      post("/site_searches").should route_to("site_searches#create")
    end

    it "routes to #update" do
      put("/site_searches/1").should route_to("site_searches#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/site_searches/1").should route_to("site_searches#destroy", :id => "1")
    end

  end
end
