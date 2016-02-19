class StaticPagesController < ApplicationController
  def root
  end

  def show
    w = WebsiteListing.find(params[:id])
    render :show
  end
end
