class Api::V1::SearchesController < ApplicationController
  respond_to :json

  def index
    respond_with Search.all
  end

  def create
    if drug = Drug.find_by(name: strong_params[:value].titleize)
      search = current_user.searches.new(drug_id: drug.id)
      search.save
    end
    render nothing: true
  end

  private

  def strong_params
    params.permit(:id, :value)
  end
end
