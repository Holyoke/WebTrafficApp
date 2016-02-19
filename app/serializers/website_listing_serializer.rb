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

class WebsiteListingSerializer < ActiveModel::Serializer
  attributes :name, :url, :rank, :note
end
