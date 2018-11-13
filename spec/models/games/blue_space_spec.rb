# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Games::BlueSpace do
  context 'CRUD a blue space' do
    it 'Create a blue space' do
      blue_space = build(:blue_space, player_id: 1, current_scene_id: 1)
      expect(blue_space).to be_a_instance_of(Games::BlueSpace)
    end

    it 'Update a blue space' do
      blue_space = create(:blue_space, player_id: 1, current_scene_id: 1)
      blue_space.update(current_scene_id: 2)

      expect(blue_space.current_scene_id).to eq 2
    end
  end

  let(:current_scene) {
    create(:blue_space_scene, name: 'first scene')
  }
  let(:next_scene) {
    create(:blue_space_scene, name: 'second scene')
  }

  let(:current_conversation) {
    create(:conversation, scene: current_scene, content: 'aaa', next_id: next_conversation.id)
  }

  let!(:next_conversation) {
    create(:conversation, scene: current_scene, content: 'xxx', next_id: nil)
  }

  let!(:next_scene_conversation) {
    create(:conversation, scene: next_scene, content: 'xxx')
  }

  let!(:scene_relation) {
    create(:scene_relation, scene_id: current_scene.id, next_scene_id: next_scene.id, answer: '1')
  }

  let(:blue_space) {
    create(
      :blue_space,
      current_scene_id: current_scene.id,
      current_conversation_id: current_conversation.id
    )
  }

  context 'game process' do
    it 'next scene!' do
      blue_space.next_scene!('1')

      expect(blue_space.current_scene_id).to eq next_scene.id
      expect(blue_space.current_conversation_id).to eq next_scene_conversation.id
    end

    it 'next conversation!' do
      blue_space.next_conversation!

      expect(blue_space.current_conversation_id).to eq next_conversation.id
    end

    it 'process' do
      blue_space.process

      expect(blue_space.current_conversation_id).to eq next_conversation.id
    end
  end
end
