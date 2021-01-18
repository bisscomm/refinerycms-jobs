require 'spec_helper'
require 'support/helper/generator_helper'

module Refinery
  module Jobs
    describe Job, type: :model do
      before :each do
        @job_application = FactoryBot.create :job_application
        @job = FactoryBot.create :job
      end

      context 'validations' do
        it 'requires title and description' do
          #Negative tests
          expect(FactoryBot.build(:job, description: nil)).not_to be_valid
          expect(FactoryBot.build(:job, title: nil)).not_to be_valid
          expect(FactoryBot.build(:job, title: '')).not_to be_valid
          expect(FactoryBot.build(:job, description: '')).not_to be_valid

          #Positive tests
          expect(FactoryBot.build(:job, description: 1, title: 1)).to be_valid
        end
      end

      context 'update' do
        it 'should be functional' do
          gen_title = generate_string
          gen_description = generate_string

          @job.update_attributes(title: gen_title, description: gen_description)

          expect(@job.title).to eq gen_title
          expect(@job.description).to eq gen_description
        end
      end

      context 'destroy' do
        it 'should be functional' do
          job_id = @job.id
          job_app_id = @job_application.id
          @job_application.update_attributes(job: @job)
          @job.destroy

          expect(Refinery::Jobs::JobApplication.find_by_id(job_app_id)).to be_nil
          expect(Refinery::Jobs::Job.find_by_id(job_id)).to be_nil
        end
      end

      context 'latest' do
        it 'should return the 5 latest job' do
          jobs = FactoryBot.create_list(:job, 5)

          jobs.reverse!

          expect(Refinery::Jobs::Job.latest).to eq jobs
        end
      end
    end
  end
end
