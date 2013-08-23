FactoryGirl.define do
  factory :domain, :class => Core::Models::Domain do
    sequence(:identifier) {|n| "subdomain_#{n}.domain.com" }
    host
  end
end
