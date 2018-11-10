class Games::BlueSpaceScene < ApplicationRecord
  has_many :conversations, class_name: 'Games::BlueSpaceConversation', dependent: :destroy, foreign_key: :scene_id

  def current_conversation
    Games::BlueSpaceConversation.find(current_conversation_id)
  end

  def next!(answer)
    Games::BlueSpaceScenceRelation.find_by(id: id, answer: answer)
  end
end
