FactoryGirl.define do
  factory :application, :class => Models::Core::Application do
    sequence(:name) {|n| "Application ##{n}" }
    sequence(:account_id)
  end
end
