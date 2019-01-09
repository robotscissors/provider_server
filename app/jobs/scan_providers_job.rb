class ScanProvidersJob < ApplicationJob
  queue_as :default
  # Go through each provider list every 2 days and queue jobs to scrape profile info
  def perform
    # Scanning providers
    puts "Scanning each provider"
    Provider.all.each do |x|
      puts "Scanning #{x[:url]} "
      puts GetTheProfileJob.perform_now(x[:url])
      puts "Completed #{x[:url]}"
      sleep 2.0
    end
    #GetTheProfileJob.perform_now("https://providers.keckmedicine.org/provider/Jay+R.+Lieberman/205571")
  end
end
