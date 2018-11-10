require 'rails_helper'

RSpec.describe Games::BlueSpaceScene do
  context 'CRUD a blue space scene' do
    it 'Create a scene' do
      scene = build(:blue_space_scene)
      expect(scene).to be_a_instance_of(Games::BlueSpaceScene)
    end

    it 'Update a scene' do
      scene = create(:blue_space_scene, current_conversation_id: 1)
      scene.update(current_conversation_id: 2)

      expect(scene.current_conversation_id).to eq 2
    end
  end

  it 'enter next conversation' do
    
  end
end
