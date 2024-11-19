class ApplicationController < ActionController::Base
  before_action :update_user_status

  def after_sign_in_path_for(_resource)
    root_path
  end

  def after_sign_up_path_for(_resource)
    profile_path
  end

  private

  def update_user_status
    current_user.update(status: true) if user_signed_in?
  end

  def after_sign_out_path_for(resource_or_scope)
    user = resource_or_scope.is_a?(User) ? resource_or_scope : current_user
    user&.update(status: false)
    root_path
  end
end
