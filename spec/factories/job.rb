require "factory_bot"

FactoryBot.define do
  factory :job, class: "Refinery::Jobs::Job" do
    title
    description
    created_at
  end
end
