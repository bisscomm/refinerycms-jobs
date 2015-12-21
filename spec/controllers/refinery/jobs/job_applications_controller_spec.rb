require "spec_helper"

module Refinery
  module Jobs
    describe JobApplicationsController, type: :controller do
        before :each do
          @job = FactoryGirl.create(:job)
          @job_application = FactoryGirl.create(:job_application, job: @job)
        end

      describe "GET new" do
        it "render new template" do
          allow(controller).to receive(:new)
          get :new, {job_id: @job.id, id: @job.id}
          expect(response.status).to eq 200
          expect(response).to render_template(:new)
        end
      end
    end
  end
end