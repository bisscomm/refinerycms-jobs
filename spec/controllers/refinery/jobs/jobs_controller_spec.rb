require "spec_helper"

module Refinery
  module Jobs
    describe JobsController, type: :controller do
      before :each do
        @job = FactoryGirl.create(:job)
      end

      describe "GET index" do
        it "render index template" do
          allow(controller).to receive(:index)
          get :index
          expect(response.status).to eq 200
          expect(response).to render_template(:index)
        end
      end
      describe "GET show" do
        it "render show template" do
          allow(controller).to receive(:show).and_return(@job)
          get :show, id: @job.id
          expect(response.status).to eq 200
          expect(response).to render_template(:show)
        end
      end
    end
  end
end