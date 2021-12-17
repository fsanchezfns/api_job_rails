class V1::JobsController < ApplicationController
  before_action :check_enterprise
  before_action :find_job, only: %i[show update]

  def index
    render(json: @current_enterprise.jobs)
  end

  def show
    if @job.present?
      response, status = format_success(@job.json)
    else
      response, status = format_error("not found job with id #{params[:id]}")
    end

    render(json: response, status: status)
  end

  def create
    @job = Job.new(job_params)
    @job.enterprise = @current_enterprise
    if @job.save
      response, status = format_success(@job.json)
    else
      response, status = format_error(@job.errors.full_messages)
    end
    render(json: response, status: status)
  end

  def update
    if @job.present?
      if @job.update(job_params)
        response, status = format_success(@job.json)
      else
        response, status = format_error(@job.errors.full_messages)
      end
    else
      response, status = format_error("not found job with id #{params[:id]}")
    end
    render(json: response, status: status)
  end

  private

  def find_job
    @job = @current_enterprise.jobs.find_by(id: params[:id])
  end

  def job_params
    params.require(:job).permit(:name, :description, :requirements, :time, :enable)
  end
end
