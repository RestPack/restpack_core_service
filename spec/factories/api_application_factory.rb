FactoryGirl.define do
  factory :api_application, class: Hash do
    sequence(:name) {|n| "Application ##{n}" }
    sequence(:account_id)

    initialize_with { attributes }
  end
end
