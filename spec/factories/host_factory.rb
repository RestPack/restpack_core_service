FactoryGirl.define do
  factory :host, :class => Core::Models::Host do
    sequence(:name) {|n| "Host ##{n}" }
    application
  end
end
