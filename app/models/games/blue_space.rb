class Games::BlueSpace < ApplicationRecord
  def current_scence
    Games::BlueSpaceScence.find(current_scence_id)
  end
end
