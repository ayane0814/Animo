class Public::LaughedButtonsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @post = Post.find(params[:post_id])
        @laughed = @post.laughed_buttons.new(user_id: current_user.id)
        @laughed.save
        @post.create_notification_laughed!(current_user)
        # 上の一行のせいで非同期化
    end
    
    def destroy
        @post = Post.find(params[:post_id])
        laughed = current_user.laughed_buttons.find_by(post_id: @post.id)
        laughed.destroy
    end
end
