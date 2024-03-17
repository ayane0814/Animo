class Admin::HomesController < ApplicationController
    before_action :authenticate_admin!
    
    def top
        respond_to do |format|
            format.html do
                @posts = Post.page(params[:page])
            end
            format.json do
                @posts = Post.all
            end
        end
        
        @published_posts = Post.published.order(created_at: :desc).page(params[:page])
    end
end
