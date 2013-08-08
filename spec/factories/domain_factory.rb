FactoryGirl.define do
  factory :domain, :class => Models::Domain do
    sequence(:identifier) {|n| "subdomain_#{n}.domain.com" }
    host
  end
end
