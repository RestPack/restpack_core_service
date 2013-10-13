FactoryGirl.define do
  factory :api_domain, class: Hash do
    sequence(:identifier) {|n| "domain_#{n}.com" }
    sequence(:application_id)

    initialize_with { attributes }
  end
end
