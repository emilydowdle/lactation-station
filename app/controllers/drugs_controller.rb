class DrugsController < ApplicationController
  def index
    @drugs = Drug.all
  end

  def show
    name = params[:name].titleize
    @drug_lact_med = Drug.find_by(name: name)
    med            = OpenFdaService.new
    @drug_fda      = med.drugs_by_name(@drug_lact_med.name)
  end

  def search_by_name
  end

  def search_by_usage
  end
end
