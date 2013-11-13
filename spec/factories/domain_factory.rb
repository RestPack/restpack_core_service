FactoryGirl.define do
  factory :domain, :class => Models::Core::Domain do
    application
    sequence(:identifier) {|n| "domain_#{n}.com" }
  end
end
