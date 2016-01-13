class DrugsController < ApplicationController
  def index
    @drugs = Drug.all
  end

  def show
    # binding.pry
    @drug_lact_med = Drug.find(params[:id])
    med            = OpenFdaService.new
    @drug_fda      = med.drugs_by_name(@drug_lact_med.name)
  end

  def search_by_name
  end

  def search_by_usage
  end
end
