class Public::FollowsController < ApplicationController
    before_action :authenticate_user!
    
    def index
    end
    
    def create
        @user.create_notification_follow!(current_user)
    end
    
    def destroy
    end
end
