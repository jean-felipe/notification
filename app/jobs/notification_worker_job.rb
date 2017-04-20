class NotificationWorkerJob < ApplicationJob
  queue_as :default

  def perform(notification)
    ActionCable.server.broadcast 'notification_channel',
      notification: NotificationController.render(notification)
  end
end
