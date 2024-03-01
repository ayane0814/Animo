class Public::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_guest_user, only: [:edit]
    before_action :set_user, except: [:edit, :update, :withdraw]
    
    def show
        @user = User.find_by(name: params[:name])
        respond_to do |format|
            format.html do
                @posts = Post.page(params[:page])
            end
            format.json do
                @posts = Post.all
            end
        end
        @published_posts = @user.posts.published.order(created_at: :desc).page(params[:page])
        @draft_posts = current_user.posts.draft.order(created_at: :desc).page(params[:page])
        @unpublished_posts = current_user.posts.unpublished.order(created_at: :desc).page(params[:page])
    end
    
    def edit
        @user = User.find_by(name: params[:name])
    end
    
    def update
        @user = User.find_by(name: params[:name])
        if @user.update(user_params)
            flash[:success] = "ユーザー情報を更新しました。"
            redirect_to user_path(@user)
        else
            render :edit
        end
    end
    
    def follows_show
        @user = User.find_by(name: params[:name])
        @follows = @user.followed(@user)
        @followers = @user.follower(@user)
    end
    
    def laughed_posts
        @laughed_posts = Post.laughed_posts(@user, params[:page])
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :email, :profile_image)
    end
    
    def set_user
        name_str = params[:name]
        sanitized_name_str = name_str.gsub(/[^a-zA-Z0-9_]/, '')
        name_sym = sanitized_name_str.to_sym
        @user = User.find_by(name: name_sym)
    end
    
    def ensure_guest_user
        @user = User.find_by(name: params[:name])
        if @user.guest_user?
          redirect_to user_path(@user), notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
        end
    end
  
end
