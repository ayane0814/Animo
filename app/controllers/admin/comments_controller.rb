class Admin::CommentsController < ApplicationController
    before_action :authenticate_admin!
    
    def destroy
        @comment = Comment.find(params[:id])
        @comment.post_id = post.id
        @comment.destroy
    end
end
