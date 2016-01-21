class StatusController < ApplicationController
  def create
    Tweeter.update(params)
    redirect_to profile_path
  end
end
