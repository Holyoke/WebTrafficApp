class AddPreviewHtmlToWebsiteListings < ActiveRecord::Migration
  def change
    add_column :website_listings, :preview_html, :text, default: "<div>No Preview</div>"
  end
end
