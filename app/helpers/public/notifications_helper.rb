module Public::NotificationsHelper
    def unchecked_notifications
        @notifications = current_user.passive_notifications.where(is_read: false)
    end
end
