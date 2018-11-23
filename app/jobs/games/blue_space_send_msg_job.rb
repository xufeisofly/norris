class Games::BlueSpaceSendMsgJob < ApplicationJob
  def perform(msg, id, log: true)
    game = Games::BlueSpace.find id
    game.logs.create(player_id: nil, conversation_content: msg) if log
    ActionCable.server.broadcast 'blue_space_notifications_channel', message: html_format(msg)
  end

  private

  def html_format(msg)
    "<div class='bubble'><p>#{msg}</p></div>"
  end
end
