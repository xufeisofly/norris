FactoryBot.define do
  factory :blue_space_scene, class: 'Games::BlueSpaceScene' do
    name { 'scene' }
    current_conversation_id { 1 }
  end
end
