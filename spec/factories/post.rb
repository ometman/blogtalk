FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "Post #{n}" }
    comments_counter { 0 }
    likes_counter { 0 }
    association :user, factory: :user

    factory :post_with_comments do
      transient do
        comments_count { 5 }
      end

      after(:create) do |post, evaluator|
        create_list(:comment, evaluator.comments_count, post:)
      end
    end
  end
end
