class DrugsController < ApplicationController
  def index
    @drugs = Drug.populate_page
  end

  def show
    @drug_lact_med = Drug.find_by(name: params[:name])
    @drug_fda      = OpenFdaService.new.drugs_by_name(params[:name])
  end
end
