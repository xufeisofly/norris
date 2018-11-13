require 'rails_helper'

RSpec.describe Games::BlueSpaceScene do
  context 'CRUD a blue space scene' do
    it 'Create a scene' do
      scene = build(:blue_space_scene)
      expect(scene).to be_a_instance_of(Games::BlueSpaceScene)
    end

    it 'Update a scene' do
      scene = create(:blue_space_scene)
      scene.update(name: 'game')

      expect(scene.name).to eq 'game'
    end
  end
end
