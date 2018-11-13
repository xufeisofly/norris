# frozen_string_literal: true

class Games::BlueSpaceScene < ApplicationRecord
  has_many :conversations, class_name: 'Games::BlueSpaceConversation', dependent: :destroy, foreign_key: :scene_id

  def next(answer)
    scene_relation = Games::BlueSpaceSceneRelation.find_by(scene_id: id, answer: answer)
    self.class.find_by(id: scene_relation&.next_scene_id)
  end
end
