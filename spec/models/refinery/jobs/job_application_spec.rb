require 'spec_helper'
require 'support/helper/generator_helper'

module Refinery
  module Jobs
    describe JobApplication, type: :model do
      before :each do
        @job_application = FactoryBot.create :job_application
        @job = FactoryBot.create :job
      end

      context 'validations' do
        it 'should be functional' do
          # Negative tests
          expect(FactoryBot.build(:job_application, name: nil)).not_to be_valid
          expect(FactoryBot.build(:job_application, phone: nil)).not_to be_valid
          expect(FactoryBot.build(:job_application, email: nil)).not_to be_valid
          expect(FactoryBot.build(:job_application, email: generate_string)).not_to be_valid
          expect(FactoryBot.build(:job_application, email: "#{generate_string}@")).not_to be_valid
          expect(FactoryBot.build(:job_application, email: "#{generate_string}@{generate_string}.")).not_to be_valid
          expect(FactoryBot.build(:job_application, cover_letter: nil)).not_to be_valid
          expect(FactoryBot.build(:job_application, resume: nil)).not_to be_valid

          # Positive test
          expect(FactoryBot.build(:job_application, phone: '123-124-1234')).to be_valid
        end
      end

      context 'destroy' do
        it 'should be functional' do
          job_app_id = @job_application.id
          @job_application.update_attributes(job: @job)
          @job_application.destroy

          expect(Refinery::Jobs::JobApplication.find_by_id(job_app_id)).to be_nil
          expect(Refinery::Jobs::Job.find_by_id(@job.id)).not_to be_nil
        end
      end

    end
  end
end
