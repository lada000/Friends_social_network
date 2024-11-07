class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
    @categories = Category.all
  end

  def update
    @user = current_user

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to profile_path, notice: 'Profile updated successfully.' }
        format.json { render json: { status: 'Location updated successfully' }, status: :ok }
      else
        format.html { render :show, alert: 'Error updating profile.' }
        format.json { render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :latitude, :longitude, category_ids: [])
  end
end
