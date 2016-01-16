class Api::V1::DrugsController < ApplicationController
  respond_to :json

  def index
    respond_with Drug.all
  end

  def show
    respond_with find_drug
  end

  def letter_match
    respond_with starts_with_query
  end

  private

  def find_drug
    name = params[:name].titleize
    Drug.find_by(name: name)
  end

  def starts_with_query
    letter = params[:letter].capitalize
    Drug.where("name like ?", "#{letter}%")
  end
end
