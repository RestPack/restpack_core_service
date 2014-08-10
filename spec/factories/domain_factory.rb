FactoryGirl.define do
  factory :domain, :class => Core::Models::Domain do
    application
    sequence(:identifier) {|n| "domain_#{n}.com" }
  end
end
