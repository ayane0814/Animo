class Public::LaughedButtonsController < ApplicationController
    before_action :authenticate_user!
    
    def index
    end
    
    def create
        @post = Post.find(params[:post_id])
        laughed = current_user.laughed.new(post: @post)
        laughed.save
    end
    
    def destroy
        @post = Post.find(params[:post_id])
        laughed = current_user.laughed.find_by(post: @post)
        laughed.destroy
    end
end
