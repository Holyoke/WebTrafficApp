class Api::WebsiteListingsController < ApplicationController
  def index
    @website_listings = WebsiteListing.all
    render json: @website_listings
  end

  def update
  end

  private
end
