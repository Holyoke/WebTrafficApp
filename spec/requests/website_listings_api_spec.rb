require "rails_helper"
require "byebug"

RSpec.describe "WebsiteListing API Controller", :type => :request do

  let(:keys) do
    keys = WebsiteListing.column_names
    keys.delete("created_at")
    keys.delete("updated_at")
    keys
  end

  it "responses with a collection of website records" do
    25.times do |rank|
      FactoryGirl.create(:website_listing, rank: (rank + 1) )
    end

    listings = WebsiteListing.all

    get "/api/website_listings"
    json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success
    expect(json.length).to eq(25)

    # iterate and match each one
    json.each_with_index do |item, idx|
      listing = listings[idx]
      keys.each do |key|
        expect(item[key]).to eq(listing[key])
      end
    end
  end

  context "Pagination" do
    50.times do |rank|
      FactoryGirl.create(:website_listing, rank: (rank + 1) )
    end

    it "shows first 25 results by default" do
      get "/api/website_listings"

      listings = WebsiteListing.page(1)
      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(json.length).to eq(25)

      # iterate and match each one
      json.each_with_index do |item, idx|
        listing = listings[idx]
        keys.each do |key|
          expect(item[key]).to eq(listing[key])
        end
      end
    end

    it "shows second 25 results with parameter" do
      get "/api/website_listings?page=2"

      listings = WebsiteListing.page(2)
      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(json.length).to eq(25)

      # iterate and match each one
      json.each_with_index do |item, idx|
        listing = listings[idx]
        keys.each do |key|
          expect(item[key]).to eq(listing[key])
        end
      end
    end
  end

  it "updates a record" do
    FactoryGirl.create(:website_listing)

    patch "/api/website_listings/1", :website_listing => { name: "test"}

    expect(response).to have_http_status(200)
    expect(WebsiteListing.first.name).to eq("test")
  end
end
