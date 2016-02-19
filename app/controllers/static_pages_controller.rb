class StaticPagesController < ApplicationController
  def root
  end

  def show
    w = WebsiteListing.find(params[:id])
    html = w.parse_html.html_safe
    render text: html
  end
end
