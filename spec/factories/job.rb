require "factory_girl"

FactoryGirl.define do
  factory :job, class: "Refinery::Jobs::Job" do
    title
    description
    created_at
    draft false
    position 1
    enabled true
    published_at
  end
end