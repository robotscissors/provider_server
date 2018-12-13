module ApplicationHelper
#   require 'nokogiri'
#   require 'open-uri'
#   require 'pry'
#
#   # html = open("https://providers.keckmedicine.org/sitemap")
#   # #html = open("http://www.keckmedicine.org")
#   # doc = Nokogiri::XML(html)
#   # binding.pry
#   # puts doc
#
#   class ScrapeIt
#     attr_accessor :document, :provider_count
#
#     def initialize(url)
#       @uri = url
#     end
#
#     def scrape
#       html = open(@uri)
#       @document = Nokogiri::XML(html)
#     end
#
#     def urlProviderOnlyArray
#       #final output is an array of providers only.
#       @providers = Array.new
#       @document.css("url loc").each do |scrapedItem|
#         if scrapedItem.text.include?("/provider/")
#           @providers << scrapedItem.text
#         end
#       end
#       @provider_count = @providers.length
#       @providers
#     end
#
#
# end
#
#
#
#
# # sitemap = ScrapeIt.new("https://providers.keckmedicine.org/sitemap")
# sitemap = ScrapeIt.new("https://info.keckmedicine.org/providers/providers.xml")
# sitemap.scrape
# puts sitemap.urlProviderOnlyArray
# puts "There are #{sitemap.provider_count} providers"
# # binding.pry
# # sitemap.document.css("url loc")[0].text
# # puts sitemap.document

end
