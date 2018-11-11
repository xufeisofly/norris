FactoryBot.define do
  factory :conversation, class: 'Games::BlueSpaceConversation' do
    content { 'first conversation' }
    category { 1 }
    delay { 5 }
    scene_id { 1 }
    next_id { 2 }
  end
end
