class Public::LaughedButtonsController < ApplicationController
    before_action :authenticate_user!
    
    def index
    end
    
    def create
        @post = Post.find(params[:post_id])
        laughed = @post.laughed_buttons.new(user_id: current_user.id)
        laughed.save
    end
    
    def destroy
        @post = Post.find(params[:post_id])
        laughed = current_user.laughed_buttons.find_by(post_id: @post.id)
        laughed.destroy
    end
end
