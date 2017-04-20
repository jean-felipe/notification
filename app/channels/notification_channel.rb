class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notification_channel"
  end

  def unsubscribed
    stop_all_streams
  end

  def speak(data)
  	Notification.create(content: data['content'], notification_type: data["notification_type
  		"])
  end
end
