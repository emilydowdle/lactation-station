class ResponseParser

  attr_accessor :response

  def initialize(response)
    @response = response
  end

  def nursing_mothers
    confirm_response(@response[:nursing_mothers]).first
  end

  def description
    confirm_response(@response[:description]).first
  end

  def substance_name
    confirm_response(@response[:openfda][:substance_name]).first
  end

  def manufacturer_name
    confirm_response(@response[:openfda][:manufacturer_name]).first
  end

  def dosage
    confirm_response(@response[:dosage_and_administration]).first
  end

  def usage
    confirm_response(@response[:indications_and_usage]).first
  end

  def confirm_response(call)
    call ? call : ["No data to display"]
  end
end
