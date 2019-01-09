class ApplicationController < ActionController::Base
  #this is where we should put classes that will be used by other controllers
  require 'nokogiri'
  require 'open-uri'
  require 'net/http'

  class ScrapeIt
    attr_accessor :document, :provider_count
    def initialize(url)
      @url = url
    end

    def urlProviderOnlyArray
    #final output is an array of providers only.
      html = open(@url)
      @document = Nokogiri::XML(html)
      @providers = Array.new
      @document.css("url loc").each do |scrapedItem|
        if scrapedItem.text.include?("/provider/")
          @providers << scrapedItem.text
        end
      end
      @provider_count = @providers.length
      @providers
    end

    def getProfile
    # get data from nokogiri
      puts "getting profile for: #{@url}"
      html = open(@url)
      @document = Nokogiri::XML(html)
      # if there is no name then the profile must be invalid

      @id = /(\d)+$/.match(@url)[0].to_i
      @gender = @document.css('body div#about-panel-gender div div div').text
      @name = @document.css("h2#provider-name") ? @document.css("h2#provider-name").text : nil
      @title = @document.css("body div#about-panel-academic_title div div div")[0] ? @document.css("body div#about-panel-academic_title div div div")[0].text : nil
      @photoUrl = @document.css('div#provider-details-summary img')[0] ? @document.css('div#provider-details-summary img')[0]['src'] : nil
      @specializingIn = @document.css('body div#about-panel-specializing_in')[0] ? @document.css('body div#about-panel-specializing_in div')[1].text : nil
      @bioStatement = @document.css('body p#about-panel-professional-statement')[0] ? @document.css('body p#about-panel-professional-statement')[0].text : nil

      location = 0
      @locations_array = []
      while !@document.css('div#provider-details-locations h2')[location].nil? do
        @locations_array << @document.css('div#provider-details-locations h2')[location]
        location += 1
      end
      @locations_array = @locations_array.join(', ')
      #accepting new patients

      @specialty_list = document.css('p#specialty-list')[0] ? document.css('p#specialty-list')[0].text : nil
      
      # does the profile already exist?
      @profile_exist = Profile.where(:provider_id => @id.to_i).first
        # update profile
      if @profile_exist.nil?
        puts "Creating a new profile"
        Profile.create(
          provider_id: @id.to_i,
          url: @url,
          name: @name,
          title: @title,
          gender: @gender,
          specializing_in: @specializingIn,
          specialties: @specialty_list,
          locations: @locations_array,
          photo_url: @photoUrl,
          professional_statement: @bioStatement
        )
      else
        # update the database (it already exists)
        puts "UPDATING #{@profile_exist[:url]}"
        @profile_exist.update(
          provider_id: @id.to_i,
          url: @url,
          name: @name,
          title: @title,
          gender: @gender,
          specializing_in: @specializingIn,
          specialties: @specialty_list,
          locations: @locations_array,
          photo_url: @photoUrl,
          professional_statement: @bioStatement
        )
      end
    end
  end
end
