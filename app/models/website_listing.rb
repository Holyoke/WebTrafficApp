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

require 'byebug'

class WebsiteListing < ActiveRecord::Base
  validates :name, presence: true
  validates :url, presence: true

  def parse_html
    url = "http://" + self.url
    tmp = open(url)
    doc = Nokogiri::HTML(tmp)

    doc.to_html
  end

  def screencap
    url = "http://" + self.url
    ws = Webshot::Screenshot.instance
    ws.capture(url, "./app/assets/images/screencaps/#{self.name}.png")
  end
end
