class ApplicationController < ActionController::Base
 #this is where we should put classes that will be used by other controllers
   require 'nokogiri'
   require 'open-uri'



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
       html = open(@url)
       @document = Nokogiri::XML(html)
       # get ID from URL
       # @profile = Hash.new(
       #   :video => nil,
       #   :id => /(\d)+$/.match(@url)[0].to_i,
       #   :name => @document.css("h2#provider-name").text,
       #   :title => @document.css("body div#about-panel-academic_title div div div")[0].text,
       #   :gender => @document.css('body div#about-panel-gender div div div').text,
       #   :specializingIn => @document.css('body div#about-panel-specializing_in')[0].text,
       #   :photoUrl => @document.css('div#provider-details-summary img')[0]['src'],
       #   :bioStatement => @document.css('body p#about-panel-professional-statement')[0].text,
       #   :locations_array => @document.css('div#provider-details-locations h2').join(' ,'),
       # )

       @id = /(\d)+$/.match(@url)[0].to_i
       @gender = @document.css('body div#about-panel-gender div div div').text
       @name = @document.css("h2#provider-name") ? @document.css("h2#provider-name").text : nil
       @title = @document.css("body div#about-panel-academic_title div div div")[0] ? @document.css("body div#about-panel-academic_title div div div")[0].text : nil
       @photoUrl = @document.css('div#provider-details-summary img')[0] ? @document.css('div#provider-details-summary img')[0]['src'] : nil
       @specializingIn = @document.css('body div#about-panel-specializing_in')[0] ? @document.css('body div#about-panel-gender div div div')[0].text : nil
       @bioStatement = @document.css('body p#about-panel-professional-statement')[0] ? @document.css('body p#about-panel-professional-statement')[0].text : nil

       location = 0
       @locations_array = []
       while !@document.css('div#provider-details-locations h2')[location].nil? do
          @locations_array << @document.css('div#provider-details-locations h2')[location]
          location += 1
      end
       @locations_array = @locations_array.join(', ')
       #accepting new patients


      puts @id
      puts @gender
      puts @name
      puts @title
      puts @photoUrl
      puts @specializingIn
      puts @bioStatement
      puts @locations_array

      # byebug

       # @profile.video = nil
       # @id = /(\d)+$/.match(@url)[0].to_i
       # @name = @document.css("h2#provider-name").text
       # @title = @document.css("body div#about-panel-academic_title div div div")[0].text
       # @gender = @document.css('body div#about-panel-gender div div div').text
       # @specializingIn = @document.css('body div#about-panel-specializing_in')[0].text
       # @photoUrl = @document.css('div#provider-details-summary img')[0]['src']
       # @bioStatement = @document.css('body p#about-panel-professional-statement')[0].text
       # @locations_array = @document.css('div#provider-details-locations h2').join(' ,')
       # @video = @document.css("body iframe#main-provider-video")[0]["src"] if @document.css("body iframe#main-provider-video")[0]

       # does the profile already exist

       # is it an update or a new Record
     end
   end
end
