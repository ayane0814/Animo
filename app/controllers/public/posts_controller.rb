class Public::PostsController < ApplicationController
    before_action :authenticate_user!
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        
        tag_names = params[:tag_name].split(",")
        tags = tag_names.map { |tag_name| Tag.find_or_initialize_by(name: tag_name) }
        tags.each do |tag|
            if tag.invalid?
                @tag_name = params[:tag_name]
                @post.errors.add(:tags, tag.errors.full_messages.join("\n"))
                return render :new, status: :unprocessable_entity
            end
        end
        
        @post.tags = tags
        if @post.save
            redirect_to post_path(@post)
        else
            @tag_name = params[:tag_name]
            render :new
        end
    end
    
    def index
        @posts = Post.all
    end
    
    def show
        @post = Post.find(params[:id])
        @comment = Comment.new
    end
    
    def edit
        @post = Post.find(params[:id])
        @tag_name = @post.tags.pluck(:name).join(",")
    end
    
    def update
        @post = Post.find(params[:id])
        tag_names = params[:tag_name].split(",")
        tags = tag_names.map { |tag_name| Tag.find_or_create_by(name: tag_name) }
        tags.each do |tag|
            if tag.invalid?
                @tag_name = params[:tag_name]
                @post.errors.add(:tags, tag.errors.full_messages.join("\n"))
                return render :edit, status: :unprocessable_entity
            end
        end
        
        @post.tags = tags
        if @post.update(post_params)
            redirect_to post_path(@post)
        else
            @tag_name = params[:tag_name]
            render :edit
        end
    end
    
    def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to posts_path
    end
    
    def draft
    end
    
    private
    
    def post_params
        params.require(:post).permit(:posted_title, :post_content, :image)
    end
end
