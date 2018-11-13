# frozen_string_literal: true

class Games::BlueSpace < ApplicationRecord
  def current_scene
    Games::BlueSpaceScene.find_by(id: current_scene_id)
  end

  def current_conversation
    Games::BlueSpaceConversation.find_by(id: current_conversation_id)
  end

  def next_scene!(answer)
    return if current_scene.next(answer).nil?

    self.current_scene_id = current_scene.next(answer).id

    return if current_scene.conversations.empty?

    self.current_conversation_id = current_scene.conversations.first.id
    self.save!
  end

  def next_conversation!
    return if current_conversation.last_of_scene?

    self.current_conversation_id = current_conversation.next_id
    self.save!
  end

  def process
    current_scene.conversations.each do |conversation|
      Games::BlueSpaceSendMsgJob.set(
        wait: current_conversation.delay.seconds
      ).perform_later(conversation.content)
      next_conversation!
    end
  end
end
