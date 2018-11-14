class Games::BlueSpaceSendMsgJob < ApplicationJob
  def perform(msg)
    msg = html_format(msg)
    ActionCable.server.broadcast 'blue_space_notifications_channel', message: html_format(msg)
    # Games::BlueSpaceLog.create(player_id: 0, conversation_content: html_format(msg))
  end

  private

  def html_format(msg)
    "<div class='bubble'><p>#{msg}</p></div>"
  end
end
