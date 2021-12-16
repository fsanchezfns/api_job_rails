class V1::EnterprisesController < ApplicationController
  before_action :check_token

  def index
    if current_enterprise?
      response, status = format_success(@current_enterprise.json)
    else
      response , status = format_error('user without enterprise or register with candidate')
    end
    render(json:response,status:status)
  end

  def create
    unless user_registered
      @enterprise = Enterprise.new(enterprise_params)
      if @enterprise.save
        response, status = format_success(@enterprise.to_json)
      else
        response, status = format_error(@enterprise.errors.full_messages)
      end

      render(json: response, status: status)
    end
  end

  def update; end

  private

  def enterprise_params
    params.require(:enterprise).permit(:name, :nacionality)
  end
end
