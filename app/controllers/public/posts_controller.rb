class Public::PostsController < ApplicationController
    before_action :authenticate_user!
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
            redirect_to post_path(@post)
        else
            flash[:notice] = "画像を選択してください"
            render :new
        end
    end
    
    def index
        @post = Post.all
    end
    
    def show
        @post = Post.find(params[:id])
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
    
    def draft
    end
    
    private
    
    def post_params
        params.require(:post).permit(:posted_title, :post_content, :image)
    end
end
