class V1::SubscriptionsController < ApplicationController
  before_action :check_candidate
  before_action :find_subscription, only: %i[show]
  def index
    response, status = format_success(@current_candidate.subscriptions.map(&:json))
    render(json: response, status: status)
  end

  def show
    if @subscription.present?
      response, status = format_success(@subscription.json)
    else
      response, status = format_error("not found subscription with id #{params[:id]}")
    end

    render(json: response, status: status)
  end

  def create
    @job = Job.find_by(id: subscription_params[:job_id])
    if @job.present? && @job.enable?
      if !is_subscription?
        @subscription = Subscription.new(candidate: @current_candidate, job: @job, state: Subscription::STATE[:i])
        if @subscription.save
          response, status = format_success(@subscription.json)
        else
          response, status = format_error(@subscription.errors.full_messages)
        end
      else
        response, status = format_error('subscription existing')
      end

    else
      response, status = format_error('jobs not sucess')
    end

    render(json: response, status: status)
  end

  private

  def is_subscription?
    subscription = Subscription.find_by(candidate: @current_candidate, job: @job)
    subscription.present?
  end

  def find_subscription
    @subscription = @current_candidate.subscriptions.find_by(id: params[:id])
  end

  def subscription_params
    params.require(:subscription).permit(:job_id)
  end
end
