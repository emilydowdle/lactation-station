require 'httparty'

class OpenFdaService
  include HTTParty
  base_uri "https://api.fda.gov"

  attr_accessor :key

  def initialize
    @key = ENV['open_fda_api_key']
  end

  def drugs_by_name(name)
    response = self.class.get(search_uri(name))
    if response.success?
      all_data = convert_to_json(response)[:results].first
      ResponseParser.new(all_data)
    else
      response.message
    end
  end

  def search_uri(name)
    "/drug/label.json?api_key=#{@key}&search=substance_name:\"#{name}\""
  end

  private

  def convert_to_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
