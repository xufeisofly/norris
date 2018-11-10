class Games::BlueSpaceConversation < ApplicationRecord
  belongs_to :scene, class_name: 'Games::BlueSpaceScence', foreign_key: :scene_id
end
