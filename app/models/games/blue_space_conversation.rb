class Games::BlueSpaceConversation < ApplicationRecord
  belongs_to :scene, class_name: 'Games::BlueSpaceScene', foreign_key: :scene_id

  enum category: { statement: 1, question: 2 }
end
