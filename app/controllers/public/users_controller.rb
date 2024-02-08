class Public::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_guest_user, only: [:edit]
    
    def laughed_posts
        @laughed_posts = Post.laughed_posts(current_user)
    end
    
    private
    
    def ensure_guest_user
        @user = User.find(params[:id])
        if @user.guest_user?
          redirect_to show_user_path(current_user), notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
        end
    end
  
end
