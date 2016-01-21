class StatusController < ApplicationController
  def create
    Tweeter.update(params, current_user)
    redirect_to profile_path
  end
end
