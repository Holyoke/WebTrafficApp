# == Schema Information
#
# Table name: website_listings
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  url        :string           not null
#  rank       :integer
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class WebsiteListing < ActiveRecord::Base
end
