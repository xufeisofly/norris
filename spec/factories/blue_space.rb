FactoryBot.define do
  factory :blue_space, class: 'Games::BlueSpace' do
    player_id { 1 }
    current_scene_id { 1 }
  end
end
