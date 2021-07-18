class FollowingsController < ApplicationController
  def create
    id1 = params[:ids][:id1]
    id2 = params[:ids][:id2]
    @following = Following.new(user_id: id1, followed_id: id2)
    @following.save
    redirect_to users_path
  end

  def destroy
    following = Following.find(params[:following_id])
    following.destroy
    redirect_to user_path(current_user.id)
  end
end
