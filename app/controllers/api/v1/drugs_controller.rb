class Api::V1::DrugsController < ApplicationController
  respond_to :json

  def index
    respond_with Drug.all
  end

  def show
    respond_with find_drug
  end

  def letter_match
    respond_with Drug.starts_with_query(strong_params)
  end

  private

  def find_drug
    name = params[:name].titleize
    Drug.find_by(name: name)
  end

  def strong_params
    params.permit(:id, :name, :letter)
  end
end
