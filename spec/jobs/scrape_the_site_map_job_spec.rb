require 'rails_helper'

RSpec.describe ScrapeTheSiteMapJob, type: :job do
  let(:url) {"https://info.keckmedicine.org/providers/providers.xml"}
  it "reaches a URL and returns 200" do
    puts "scraping"
    ScrapeTheSiteMapJob.perform_now(url)
  end
end
