require "spec_helper"

module Refinery
  module Jobs
    module Admin
      describe JobApplicationsController, type: :controller do
        before :each do
          @job = FactoryGirl.create(:job)
          @job_application = FactoryGirl.create(:job_application, job: @job)
        end

        context "#index" do
          it "renders index template" do
            #get :index
            #expect(response).to render_template("index")
          end
        end
      end
    end
  end
end