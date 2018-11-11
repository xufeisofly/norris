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

  context 'enter next conversation' do
    let(:scene) { create(:blue_space_scene) }

    let(:current_conversation) {
      create(:conversation, content: 'first', scene_id: scene.id, next_id: nil)
    }

    let(:next_conversation) {
      create(:conversation, content: 'second', scene_id: scene.id, next_id: nil)
    }

    before { scene.current_conversation_id = current_conversation.id }

    it 'not reached the last conversation' do
      current_conversation.update(next_id: next_conversation.id)
      scene.next_conversation!

      expect(scene.current_conversation).to eq next_conversation
    end

    it 'reached the last conversation' do
      scene.next_conversation!

      expect(scene.current_conversation).to eq current_conversation
    end
  end
end
