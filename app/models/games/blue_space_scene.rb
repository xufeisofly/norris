# frozen_string_literal: true

class Games::BlueSpaceScene < ApplicationRecord
  has_many :conversations, class_name: 'Games::BlueSpaceConversation', dependent: :destroy, foreign_key: :scene_id
  has_many :relations, class_name: 'Games::BlueSpaceSceneRelation', dependent: :destroy, foreign_key: :scene_id

  accepts_nested_attributes_for :relations, allow_destroy: true

  def next(answer)
    self.class.find_by(id: relation(answer)&.next_scene_id)
  end

  def answer_valid?(answer)
    self.next(answer).present?
  end

  def relation(answer)
    Games::BlueSpaceSceneRelation.find_by(scene_id: id, answer: answer)
  end
end
