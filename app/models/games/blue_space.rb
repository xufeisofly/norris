# frozen_string_literal: true

class Games::BlueSpace < ApplicationRecord
  def current_scene
    Games::BlueSpaceScene.find_by(id: current_scene_id)
  end

  def next_scene!(answer)
    self.current_scene_id = self.current_scene.next(answer).id
    save!
  end

  def process
    msg = current_scene.current_conversation.content
    Games::BlueSpaceSendMsgJob.set(wait: current_conversation.delay.seconds).perform_later(msg)

    return if current_scene.current_conversation.last_of_scene?

    current_scene.next_conversation!
  end
end
