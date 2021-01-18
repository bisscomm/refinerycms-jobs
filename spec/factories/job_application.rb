require "factory_bot"

FactoryBot.define do
  factory :job_application, class: "Refinery::Jobs::JobApplication" do
    name
    phone '321-123-1234'
    email
    cover_letter
    resume '/refinerycms-jobs/spec/support/fixtures/refinery_is_awesome.txt'
  end
end
