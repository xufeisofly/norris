# frozen_string_literal: true

class Games::BlueSpace < ApplicationRecord
  def current_scene
    Games::BlueSpaceScene.find_by(id: current_scene_id)
  end

  def next_scene!(answer)
    self.current_scene_id = self.current_scene.next(answer).id
    save!
  end
end
