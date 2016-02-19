# == Schema Information
#
# Table name: website_listings
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  url          :string           not null
#  rank         :integer
#  note         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  preview_html :text             default("<div>No Preview</div>")
#

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

  it "returns a parsed html" do
    listing = WebsiteListing.create({name: "Google", url: "Google.com"})

    expect(listing.parse_html).to_not be_empty
  end
end
