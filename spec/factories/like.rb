FactoryBot.define do
    factory :like do
      association :user
      association :post
      # Other attributes for the Comment model...
  
      # Traits or additional configurations if needed
    end
  end
  