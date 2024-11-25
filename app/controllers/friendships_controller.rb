class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    friend = User.find(params[:friend_id])
    current_user.friendships.create(friend: friend, status: "pending")
    redirect_to root_path, notice: "Friend request sent to #{friend.name}"
  end

  def update
    friendship = Friendship.find(params[:id])
    if params[:status] == "accepted"
      friendship.update!(status: "accepted")
      Friendship.create!(user: friendship.friend, friend: friendship.user, status: "accepted")
      redirect_to profile_path, notice: "Friend request accepted"
    elsif params[:status] == "declined"
      friendship.update!(status: "declined")
      redirect_to profile_path, alert: "Friend request declined"
    else
      redirect_to profile_path, alert: "Invalid action"
    end
  end

  def destroy
    friendship = Friendship.find(params[:id])
    inverse_friendship = Friendship.find_by(user: friendship.friend, friend: friendship.user)

    Friendship.transaction do
      friendship.destroy
      inverse_friendship&.destroy
    end

    redirect_to profile_path, notice: "Friend removed successfully"
  end
end
