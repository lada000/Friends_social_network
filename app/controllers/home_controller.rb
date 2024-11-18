class HomeController < ApplicationController
  def index
    if user_signed_in?
      @perfect_matches = current_user.perfect_matches
      @potential_friends = current_user.potential_friends
    else
      @perfect_matches = []
      @potential_friends = []
    end
  end
end
