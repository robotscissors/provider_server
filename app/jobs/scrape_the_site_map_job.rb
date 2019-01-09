class ScrapeTheSiteMapJob < ApplicationJob
  queue_as :default

  def perform
    # @testx = ApplicationController::ScrapeIt.new("https://keck.usc.edu")
    # @testx.valid?
    self.updateDatabase
    puts "Messages: #{@messages}"
    puts "SCRAPE COMPLETED"
  end

  def updateDatabase
    @providers = ApplicationController::ScrapeIt.new(Figaro.env.sitemap_scrape_url)
    @providerList = @providers.urlProviderOnlyArray
    # new profiles
    @messages = []
    @new_providers = []
    @deleted_providers = []
    @update_list = []
    # deleted profiles
    @current_providers = Provider.all

    @providerList.each do |providerString|
      @providerUrl = providerString
      @providerOldId = /(\d)+$/.match(providerString)[0].to_i
      # is there already a record for This
      @current_provider = Provider.where(:original_id => @providerOldId)

      if !@current_provider[0].nil?
        if @current_provider[0][:url] != @providerUrl
          #update
          @current_provider[0].update(:url => @providerUrl)
          @messages << "Update to profile: #{@providerUrl}"
          #@update_list << @providerUrl #and update was made
        end
      else
        #create
        Provider.create(original_id: @providerOldId, url: @providerUrl)
        #@new_providers << @providerUrl #a new provider was just added
        @messages << "New provider profile: #{@providerUrl}"
      end
    end
    #check to see if any were deleted
    @current_providers.each do |check_if_deleted|
      if !@providerList.include?(check_if_deleted['url'])
        @messages << "Profile deleted: #{check_if_deleted['url']}"
        Provider.where(url: check_if_deleted['url']).destroy_all
      end
    end
  end

end
