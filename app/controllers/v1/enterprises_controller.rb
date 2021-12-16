class V1::EnterprisesController < ApplicationController
  before_action :check_token

  def index
    if current_enterprise?
      response, status = format_success(@current_enterprise.json)
    else
      response, status = format_error('user without enterprise or register with candidate')
    end
    render(json: response, status: status)
  end


  def create
    if user_registered?
      response, status = format_error('the user is registered')
    else
      @enterprise = Enterprise.new(enterprise_params)
      @enterprise.user = @current_user
      if @enterprise.save
        response, status = format_success(@enterprise.json)
      else
        response, status = format_error(@enterprise.errors.full_messages)
      end
    end
    render(json: response, status: status)
  end

  ## como la ruta es v1/enterprises/:id, implemento el id pero no tiene mucho sentido ya que la relación es 1 a 1, tome la desición de comparar el id para no romper el estadar, lo mismo esta en candidate
  def update
    if !current_enterprise?
      response, status = format_error('user not register with enterprise')
    elsif !(@current_enterprise.id.to_s == params[:id])
      response, status = format_error('not found enterprise')
    elsif @current_enterprise.update(enterprise_params)
      response, status = format_success(@current_enterprise.json)
    else
      response, status = format_error(@current_enterprise.errors.full_messages)
    end
    render(json: response, status: status)
  end

  private

  def enterprise_params
    params.require(:enterprise).permit(:name, :nationality)
  end
end
