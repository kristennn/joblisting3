class JobsController < ApplicationController
before_action :require_is_admin, only: [:show]
  def index
    @jobs = case params[:order]
    when 'by_lower_bound'
      Job.where(:is_hidden => false).order('wage_lower_bound DESC')
    when 'by_upper_bound'
      Job.where(:is_hidden => false).order("wage_upper_bound DESC")
    else
      Job.where(:is_hidden => false).order("created_at DESC")
    end
  end

  def show
    @job = Job.find(params[:id])
  end

end
