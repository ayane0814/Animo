class Public::PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :post_edit_user, only: [:edit, :update]
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        
        if params[:draft].present?
            @post.is_display = :draft
            flash[:notice] = "下書きが保存されました。"
        else
            @post.is_display = :published
            flash[:notice] = "投稿が公開されました"
        end
        
        tag_names = params[:tag_name].split(",")
        tags = tag_names.map { |tag_name| Tag.find_or_initialize_by(name: tag_name) }
        tags.each do |tag|
            if tag.invalid?
                @tag_name = params[:tag_name]
                @post.errors.add(:tags, tag.errors.full_messages.join("\n"))
                return render :new, is_display: :unprocessable_entity
            end
        end
        
        @post.tags = tags
        if @post.save
            if @post.draft?
                redirect_to draft_posts_path
            else
                redirect_to post_path(@post)
            end
        else
            @tag_name = params[:tag_name]
            render :new
        end
    end
    
    def index
        respond_to do |format|
            format.html do
                @posts = Post.page(params[:page])
            end
            format.json do
                @posts = Post.all
            end
        end
        @published_posts = Post.published.order(created_at: :desc).page(params[:page])
        @draft_posts = current_user.posts.draft.order(created_at: :desc).page(params[:page])
        @unpublished_posts = current_user.posts.unpublished.order(created_at: :desc).page(params[:page])
    end
    
    def show
        @post = Post.find(params[:id])
        @comment = Comment.new
    end
    
    def edit
        @post = Post.find(params[:id])
        @post.user_id = current_user.id
        
        @tag_name = @post.tags.pluck(:name).join(",")
    end
    
    def update
        @post = Post.find(params[:id])
        @post.user_id = current_user.id
        
        if params[:draft].present?
            @post.is_display = :draft
            flash[:notice] = "下書きを保存しました。"
        elsif params[:unpublished].present?
            @post.is_display = :unpublished
            flash[:notice] = "非公開にしました。"
        else
            @post.is_display = :published
            flash[:notice] = "投稿を更新しました。"
        end
        
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
        params.require(:post).permit(:posted_title, :post_content, :image, :address)
    end
    
    def post_edit_user
        post = Post.find_by(id: params[:id])
        unless post && post.user_id == current_user.id
            redirect_to user_path(current_user)
        end
    end
end
