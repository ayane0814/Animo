class Public::NotificationsController < ApplicationController
    
    def index
        @notifications = current_user.passive_notifications.page(params[:page]).per(20)
        @notifications.where(is_read: false).each do |notification|
            notification.is_read = true
            notification.save
        end
    end
end
