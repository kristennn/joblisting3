class Admin::JobsController < ApplicationController
before_action :authenticate_user!
before_action :require_is_admin

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to admin_jobs_path
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      flash[:notice] = "Update success"
      redirect_to admin_jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:alert] = "Job Deleted"
    redirect_to admin_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email)
  end

end