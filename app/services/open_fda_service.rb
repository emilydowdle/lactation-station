# api_key = ENV['LACTATION_STATION_DATABASE_PASSWORD']
# ailment = "migraine"
# response = HTTParty.get("https://api.fda.gov/drug/label.json?api_key=#{api_key}&search=indications_and_usage:\"#{}\"")
#
# https://api.fda.gov/drug/label.json?api_key=qeYtLsY20bNvlWTUobhZoLqvg8Te9M6XCsy7pIuj
# &search=indications_and_usage:"migraine"
require 'httparty'

class OpenFdaService
  include HTTParty
  base_uri "https://api.fda.gov"

  attr_accessor :key

  def initialize()
    @key = ENV['open_fda_api_key']
  end

  def drugs_by_indication(ailment)
    response = self.class.get("/drug/label.json?api_key=#{@key}&search=indications_and_usage:\"#{ailment}\"")
    if response.success?
      puts response
    else
      raise response.response
    end
  end
end

med = OpenFdaService.new
med.drugs_by_indication("migraine")
