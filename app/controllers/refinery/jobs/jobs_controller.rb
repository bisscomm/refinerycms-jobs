module Refinery
  module Jobs
    class JobsController < ::ApplicationController
      include ControllerHelper

      before_action :find_page
      before_action :find_all_jobs, only: :index
      before_action :find_job, only: :show
      before_action :new_job_applicaton, only: [:index, :show]

      def show
        @breadcrumb = OpenStruct.new({
          title: @job.title,
          url: refinery.jobs_job_url(@job)
        })
      end
    end
  end
end