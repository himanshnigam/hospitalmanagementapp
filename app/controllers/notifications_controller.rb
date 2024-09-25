class NotificationsController < ApplicationController
  def index
    notifications = current_user.notifications.unread
    render json: notifications
  end

  def mark_as_read
    notification = current_user.notifications.find(params[:id])
    notification.update(read_at: Time.current)
    render json: { message: 'Notification marked as read.' }
  end
end