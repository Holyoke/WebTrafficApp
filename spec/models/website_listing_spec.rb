require 'rails_helper'

RSpec.describe WebsiteListing, type: :model do
  let(:incomplete_listing) { WebsiteListing.new}

  it "validates presence of name" do
    expect(incomplete_listing).not_to be_valid
  end

  it "validates the presence of a url" do
    incomplete_listing.name = "Foobar"
    expect(incomplete_listing).not_to be_valid
  end

  it "validates the url ends in a domain"
end
