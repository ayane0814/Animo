class Admin::CommentsController < ApplicationController
    before_action :authenticate_admin!
    
    def destroy
        @comment = Comment.find(params[:id]).destroy
    end
end
