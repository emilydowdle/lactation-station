class ResponseParser

  attr_accessor :response

  def initialize(response)
    @response = response
  end

  def nursing_mothers
    @response[:nursing_mothers].first
  end

  def description
    @response[:description].first
  end

  def substance_name
    @response[:openfda][:substance_name].first
  end

  def manufacturer_name
    @response[:openfda][:manufacturer_name].first
  end

  def dosage
    @response[:dosage_and_administration].first
  end

  def usage
    @response[:indications_and_usage].first
  end


end
