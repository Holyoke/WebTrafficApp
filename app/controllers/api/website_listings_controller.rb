class Api::WebsiteListingsController < ApplicationController
  def index
    @website_listings = WebsiteListing.page(params[:page])
    render json: @website_listings
  end

  def update
    @website_listing = WebsiteListing.find(params[:id])

    if @website_listing.update(website_listing_params)
      render json: @website_listing, status: :ok
    else
      render json: @website_listing.errors, status: :unprocessable_entity
    end
  end

  private

  def website_listing_params
    params.require(:website_listing).permit(:name, :url, :note)
  end
end
