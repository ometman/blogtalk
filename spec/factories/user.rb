FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user_#{n}" }
    photo { ActionController::Base.helpers.asset_path('photo.jpg') }
    posts_counter { 0 }
    trait :with_posts do
      after(:create) do |user|
        create_list(:post, 3, author: user)
      end
    end
  end
end
