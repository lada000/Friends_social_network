class UsersController < ApplicationController
  before_action :authenticate_user!

  def ping
    current_user.update!(status: true, last_active_at: Time.current)
    head :ok
  end
end
