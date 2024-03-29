class Public::CommentsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        post = Post.find(params[:post_id])
        @comment = current_user.comments.new(comment_params)
        @comment.post_id = post.id
        @comment.save
        post.create_notification_comment!(current_user, @comment.id)
    end
    
    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
    end
    
    private
    
    def comment_params
        params.require(:comment).permit(:comment_content)
    end
end