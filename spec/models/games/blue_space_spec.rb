require "rails_helper"

RSpec.describe Games::BlueSpace do
  context 'CRUD a blue space' do
    it 'Create a blue space' do
      blue_space = build(:blue_space, player_id: 1, current_scene_id: 1)
      expect(blue_space).to be_a_instance_of(Games::BlueSpace)
    end
  end
end
