require 'nokogiri'
require 'open-uri'
require 'csv'

class AlexaScraper
  attr_reader :websites, :pages
  def initialize(url)
    @base_url = url
    @site_html = Nokogiri::HTML(open(url))
    @page_urls = []
  end

  def scrape_pages(total, suffix)
    query_string = suffix.split("0")

    total.times do |x|
      url = @base_url + query_string[0] + x.to_s + query_string[1]
      @site_html = Nokogiri::HTML(open(url))
      scrape_page_listings
    end
  end

  def extract_websites_from(listings)
    listings.each do |listing|
      url = listing.css(".desc-paragraph a").inner_html
      name = url.gsub(/.(net|com|io|org|co|go)/, "")
      rank = listing.css(".count").inner_html
      WebsiteListing.create({name: name, url: url, rank: rank})
    end
  end

  def scrape_page_listings
    listings = @site_html.css('.site-listing')
    extract_websites_from(listings)
  end
end

# Driver
base_url = "http://www.alexa.com/topsites/"
scraper = AlexaScraper.new(base_url)

scraper.scrape_pages(4, "countries;0/US")
