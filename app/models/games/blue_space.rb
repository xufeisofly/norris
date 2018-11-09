class Games::BlueSpace < ApplicationRecord
  has_many :players, class_name: 'User', foreign_key: :player_id

  def current_scence
    Games::BlueSpaceScence.find(current_scence_id)
  end
end
