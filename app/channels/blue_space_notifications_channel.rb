class BlueSpaceNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'blue_space_notifications_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
