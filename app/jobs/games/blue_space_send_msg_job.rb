class Games::BlueSpaceSendMsgJob < ApplicationJob
  def perform(msg)
    msg = html_format(msg)
    ActionCable.server.broadcast 'blue_space_notifications_channel', message: html_format(msg)
    # Games::BlueSpaceLog.create(player_id: 0, conversation_content: html_format(msg))
    # Games::BlueSpace.process
  end

  private

  def html_format(msg)
    "<p>#{msg}</p>"
  end
end
