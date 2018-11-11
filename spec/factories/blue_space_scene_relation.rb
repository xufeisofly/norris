FactoryBot.define do
  factory :scene_relation, class: 'Games::BlueSpaceSceneRelation' do
    scene_id { 1 }
    next_scene_id { 2 }
    answer { '1' }
  end
end
