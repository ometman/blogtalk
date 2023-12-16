FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user_#{n}" }
    posts_counter { 0 }

    # Other traits and attributes for the User model...

    trait :with_posts do
      after(:create) do |user|
        create_list(:post, 3, author: user)
      end
    end
  end
end
  