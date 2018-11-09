class Games::BlueSpaceScence < ApplicationRecord
  has_many :conversations, class_name: 'Games::BlueSpaceConversation'
  
end
