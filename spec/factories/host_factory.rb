FactoryGirl.define do
  factory :host, :class => Models::Host do
    sequence(:name) {|n| "Host ##{n}" }
    application
  end
end
