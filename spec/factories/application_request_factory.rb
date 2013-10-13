FactoryGirl.define do
  factory :application_request, class: Hash do
    sequence(:name) {|n| "Application ##{n}" }
    sequence(:account_id)

    initialize_with { attributes }
  end
end
