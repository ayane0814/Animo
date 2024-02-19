class Public::FollowsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @users = User.all
    end
    
    def show
        @user = User.find(params[:id])
        @follows = @user.followed(@user)
        @followers = @user.follower(@user)
    end
    
    def create
        Follower.find_or_create_by(user_id: params[:follow_id], follow_id: current_user.id)
        redirect_to follows_path
        # @user.create_notification_follow!(current_user)
    end
    
    def destroy
        Follower.find_by(user_id: params[:id], follow_id: current_user.id).delete
        redirect_to follows_path
    end
end