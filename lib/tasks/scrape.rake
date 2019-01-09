namespace :scrape do
  desc "Scrape the sitemap"
  task from_the_sitemap: :environment do
    puts "#{Time.now} - Scrape sitemap (Daily)"
    ScrapeTheSiteMapJob.perform_now
  end

  desc "Get the profiles"
  task get_the_profiles: :environment do
    puts "#{Time.now} - Scanning provider list for changes (every 2 days)"
    ScanProvidersJob.perform_now
  end
end
