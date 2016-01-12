class OpenFdaService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("https://api.fda.gov/drug/label")
    connection.query[:apikey] = ENV["fda_api_key"]
  end

  def medications(params)
    parse(connection.get("legislators", params))[:results]
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
