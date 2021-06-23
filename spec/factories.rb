# frozen_string_literal: true

FactoryBot.define do
  factory :player do
    name { Faker::Name.name }
  end

  factory :score do
    player
    start_time { DateTime.now }
    points { rand(0..100) }
    playing_time { rand(0..300) }
  end
end
