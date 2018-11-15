# frozen_string_literal: true

class Games::BlueSpace < ApplicationRecord
  after_create :init_game
  has_many :logs, class_name: 'Games::BlueSpaceLog', dependent: :destroy

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
        wait: conversation.delay.seconds
      ).perform_later(conversation.content, id)
      next_conversation!
    end
  end

  def init_game
    first_scene = Games::BlueSpaceScene.first
    self.current_scene_id = first_scene.id
    self.current_conversation_id = first_scene.conversations.first.id
    self.save
  end
end
