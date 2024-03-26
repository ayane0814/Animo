class ApplicationController < ActionController::Base
    
    
    before_action :authenticate_user!, except: [:top, :about], if: :check_admin
    
    
    def check_admin
        if admin_signed_in?
            return false
        else
            return true
        end
    end
end