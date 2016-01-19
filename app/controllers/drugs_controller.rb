class DrugsController < ApplicationController
  def index
    @drugs = Drug.starts_with_query(:letter => "A")
  end

  def show
    name = params[:name]
    @drug_lact_med = Drug.find_by(name: name)
    med            = OpenFdaService.new
    @drug_fda      = med.drugs_by_name(name)
  end

  private

  def strong_params
    params.permit(:id, :name, :letter)
  end
end
