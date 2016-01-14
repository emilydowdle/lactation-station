require 'httparty'

class OpenFdaService
  include HTTParty
  base_uri "https://api.fda.gov"

  attr_accessor :key

  def initialize()
    @key = ENV['open_fda_api_key']
  end

  def drugs_by_indication(ailment)
    response = self.class.get("/drug/label.json?api_key=#{@key}&limit=10&search=indications_and_usage:\"#{ailment}\"")
    if response.success?
      eliminate_bad_data(response)
    else
      raise response.response
    end
  end

  def drugs_by_name(name)
    response = self.class.get("/drug/label.json?api_key=#{@key}&search=substance_name:\"#{name}\"")
    if response.success?
      all_data = convert_to_json(response)[:results].first
      ResponseParser.new(all_data)
    else
      response.message
    end
  end

  private

  def convert_to_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def eliminate_bad_data(drugs = [], response)
    parse(response)[:results].each do |drug|
      name = drug[:openfda][:substance_name]
      nursing = drug[:nursing_mothers]
      if name != nil && name.count == 1 && nursing != nil
        drugs << { name.first.capitalize => nursing.first }
      end
      drugs
    end
  end
end

# med = OpenFdaService.new
# # med.drugs_by_indication("migraine")
# med.drugs_by_indication("anxiety")
#
# # med.drugs_by_name("sertraline hydrochloride")
