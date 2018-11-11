# frozen_string_literal: true

class Games::BlueSpaceConversation < ApplicationRecord
  belongs_to :scene, class_name: 'Games::BlueSpaceScene', foreign_key: :scene_id

  enum category: { statement: 1, question: 2 }

  def last_of_scene?
    next_id.nil?
  end
end
