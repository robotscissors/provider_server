class ProvidersController < ApplicationController

  def index
    # @profiles = ScrapeIt.new("https://info.keckmedicine.org/providers/providers.xml")
    # @providerList = @profiles.urlProviderOnlyArray
    # @providerList.each do |providerString|
    #   @providerUrl = providerString
    #   @providerOldId = /(\d)+$/.match(providerString)[0].to_i
    #   Provider.create(original_id: @providerOldId, url: @providerUrl)
    # end
    # self.updateDatabase
    # puts "Messages: #{@messages}"
    #Profile.fetchProfile
    puts "fetching profile"
    @profile = ApplicationController::ScrapeIt.new("https://providers.keckmedicine.org/provider/Jay+R.+Lieberman/205571")
    #return profile object
    @profile.getProfile

  end

  def updateDatabase
  #   @providers = ScrapeIt.new(Figaro.env.sitemap_scrape_url)
  #   @providerList = @providers.urlProviderOnlyArray
  #   # new profiles
  #   @messages = []
  #   @new_providers = []
  #   @deleted_providers = []
  #   @update_list = []
  #   # deleted profiles
  #   @current_providers = Provider.all
  #
  #   @providerList.each do |providerString|
  #     @providerUrl = providerString
  #     @providerOldId = /(\d)+$/.match(providerString)[0].to_i
  #     # is there already a record for This
  #     @current_provider = Provider.where(:original_id => @providerOldId)
  #
  #     if !@current_provider[0].nil?
  #       if @current_provider[0][:url] != @providerUrl
  #         #update
  #         @current_provider[0].update(:url => @providerUrl)
  #         @messages << "Update to profile: #{@providerUrl}"
  #         #@update_list << @providerUrl #and update was made
  #       end
  #     else
  #       #create
  #       Provider.create(original_id: @providerOldId, url: @providerUrl)
  #       #@new_providers << @providerUrl #a new provider was just added
  #       @messages << "New provider profile: #{@providerUrl}"
  #     end
  #   end
  #   #check to see if any were deleted
  #   @current_providers.each do |check_if_deleted|
  #     if !@providerList.include?(check_if_deleted['url'])
  #       @messages << "Profile deleted: #{check_if_deleted['url']}"
  #       Provider.where(url: check_if_deleted['url']).destroy_all
  #     end
  #   end
  end

end
