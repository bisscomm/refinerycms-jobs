require 'spec_helper'
require 'helper/generator_helper'

module Refinery
  module Jobs
    describe JobApplication, type: :model do

      let(:job_application) {FactoryGirl.create(:job_application)}
      let(:job) {FactoryGirl.create(:job)}

      describe 'validations' do
        it 'should be functional' do
          # Negative tests
          expect(FactoryGirl.build(:job_application, name: nil)).not_to be_valid
          expect(FactoryGirl.build(:job_application, phone: nil)).not_to be_valid
          expect(FactoryGirl.build(:job_application, email: nil)).not_to be_valid
          expect(FactoryGirl.build(:job_application, email: generate_string)).not_to be_valid
          expect(FactoryGirl.build(:job_application, email: "#{generate_string}@")).not_to be_valid
          expect(FactoryGirl.build(:job_application, email: "#{generate_string}@{generate_string}.")).not_to be_valid
          expect(FactoryGirl.build(:job_application, cover_letter: nil)).not_to be_valid
          expect(FactoryGirl.build(:job_application, resume: nil)).not_to be_valid

          # Positive test
          expect(FactoryGirl.build(:job_application,
            { name: generate_string,
              email: generate_email,
              phone: '123-124-1234',
              cover_letter: generate_string,
              resume: "/refinerycms-jobs/spec/fixtures/refinery_is_awesome.txt"
            })).to be_valid
        end
      end

      describe 'destroy' do
        it 'should be functional' do
          job_app_id = job_application.id
          job_application.destroy

          expect(Refinery::Jobs::JobApplication.find_by_id(job_app_id)).to be_nil
          expect(Refinery::Jobs::Job.find_by_id(job.id)).not_to be_nil
        end
      end

    end
  end
end