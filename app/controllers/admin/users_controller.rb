class Admin::UsersController < ApplicationController
    before_action :authenticate_admin!
    
    def index
        @users = User.page(params[:page]).per(10)
    end
    
    def show
        @user = User.find_by(name: params[:name])
    end
    
    def edit
        @user = User.find_by(name: params[:name])
    end
    
    def update
        user = User.find_by(name: params[:name])
        user.update(user_params)
        redirect_to admin_user_path(user)
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :email, :is_active)
    end
end
