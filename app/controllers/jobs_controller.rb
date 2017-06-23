class JobsController < ApplicationController
before_action :require_is_admin, only: [:show]
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

end
