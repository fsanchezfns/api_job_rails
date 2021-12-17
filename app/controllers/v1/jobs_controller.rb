class V1::JobsController < ApplicationController
  before_action :check_enterprise, except: [:index]
  before_action :check_token, only: [:index]
  before_action :find_job, only: %i[show update subscriptions]

  # #para enterprises listar los jobs
  # #para candidate  listar los jobs enable.true
  def index
    if user_registered?

      if current_enterprise?
        response, status = format_success(@current_enterprise.jobs)
      else
        response, status = format_success(Job.where(enable: true).map(&:json))
      end
    else
      response, status = format_error('user without enterprise and without candidate')
    end

    render(json: response, status: status)
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

  def subscriptions
    if @job.present?
      response, status = format_success(@job.subscriptions.map(&:jsonfull))
    else
      response, status = format_error("not found job with id #{params[:id]}")
    end
    render(json: response, status: status)
  end

  def showsubscriptions
    if find_subscription?
      if @subscription.present?
        response, status = format_success(@subscription.jsonfull)
      else
        response, status = format_error("not found subscription with id #{@subscription_id}")
      end
      render(json: response, status: status)
    end
  end

  def updatesubscriptions
    if find_subscription?
      if @subscription.present?
        @subscription.state = subscription_params[:state]
        if @subscription.save
          response, status = format_success(@subscription.jsonfull)
        else
          response, status = format_error(@subscription.errors.full_messages)
        end
      else
        response, status = format_error("not found subscription with id #{@subscription_id}")
      end
      render(json: response, status: status)
    end
  end

  def find_subscription?
    @subscription_id = params[:id]
    job_id = params[:job_id]
    params[:id] = job_id
    find_job
    if @job.present?
      @subscription = @job.subscriptions.find_by(id: @subscription_id)
      true
    else
      response, status = format_error("not found job with id #{params[:id]}")
      render(json: response, status: status)
      false
    end
  end

  private

  def find_job
    @job = @current_enterprise.jobs.find_by(id: params[:id])
  end

  def job_params
    params.require(:job).permit(:name, :description, :requirements, :time, :enable)
  end

  def subscription_params
    #params.require(:subscription).permit(:state)
    params.permit(:state)
  end

end
