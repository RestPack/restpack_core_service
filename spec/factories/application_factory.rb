FactoryGirl.define do
  factory :application, :class => Core::Models::Application do
    sequence(:name) {|n| "Application ##{n}" }
    sequence(:account_id)
  end
end
