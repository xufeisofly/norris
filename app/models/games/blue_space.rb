# frozen_string_literal: true

class Games::BlueSpace < ApplicationRecord
  def current_scene
    Games::BlueSpaceScene.find(current_scene_id)
  end

  def next_scene!(_answer)
    self.next_scene_id = current_scene.next.id
    save!
  end
end
