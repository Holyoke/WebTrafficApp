require "rails_helper"
require "byebug"

RSpec.describe "WebsiteListing API Controller", :type => :request do

  it "responses with a collection of website records" do
    25.times do |rank|
      FactoryGirl.create(:website_listing, rank: (rank + 1) )
    end

    get "/api/website_listings"

    json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success
    expect(json.length).to eq(25)
  end

  context "Pagination" do
    50.times do |rank|
      FactoryGirl.create(:website_listing, rank: (rank + 1) )
    end

    it "shows first 25 results by default" do
      get "/api/website_listings"

      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(json.length).to eq(25)
    end
    
    it "shows the second page with 25 results"
  end
end
