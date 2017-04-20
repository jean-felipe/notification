class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notification_channel"
  end

  def unsubscribed
    stop_all_streams
  end

  def speak(data)
  	ActionCable.server.broadcast 'notification_channel', notification: data
  end
end
