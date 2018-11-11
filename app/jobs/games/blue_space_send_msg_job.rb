class Games::BlueSpaceSendMsgJob < ApplicationJob
  def perform(msg)
    # TODO: websocket send msg to frontend
    Games::BlueSpaceLog.create(player_id: 0, conversation_content: msg)
    Games::BlueSpace.process
  end
end
