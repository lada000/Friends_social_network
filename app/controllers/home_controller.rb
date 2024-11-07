class HomeController < ApplicationController
  def index
    @matches = current_user.find_matches if user_signed_in?
  end
end
