class Api::WebsiteListingsController < ApplicationController
  def index
    @website_listings = WebsiteListing.page(params[:page])
    render json: @website_listings
  end

  def update
  end

  private
end
