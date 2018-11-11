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
    create(:blue_space_scene, name: 'first scene', current_conversation_id: 1)
  }
  let(:next_scene) {
    create(:blue_space_scene, name: 'second scene', current_conversation_id: 1)
  }

  let!(:scene_relation) {
    create(:scene_relation, scene_id: current_scene.id, next_scene_id: next_scene.id, answer: '1')
  }

  it 'enter next scene' do
    blue_space = create(:blue_space, current_scene_id: current_scene.id)

    blue_space.next_scene!('1')

    expect(blue_space.current_scene_id).to eq next_scene.id
  end
end
