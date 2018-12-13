class ScrapeSitemapJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    puts "Scrape it"
  end
end
