class GetTheProfileJob < ApplicationJob
  queue_as :default

  def perform(providerURL)
    puts "getting the profile job #{providerURL} - #{Time.now()}"
    @profile = ApplicationController::ScrapeIt.new(providerURL)
    @profile.getProfile
    puts "Completed getting the #{providerURL} - #{Time.now()}"
  end

  # def fetchProfile(providerURL)
  # # get data from nokogiri
  #   puts "fetching profile #{providerURL} - #{Time.now()}"
  #
  # end
end
