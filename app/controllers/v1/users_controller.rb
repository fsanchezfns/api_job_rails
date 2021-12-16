class V1::UsersController < ApplicationController
  before_action :check_token, only: [:logout]

  def create
    @user = User.new(user_params)
    if @user.save
      response, status = format_success(@user.json)
    else
      response, status = format_error(@user.errors.full_messages)
    end

    render(json: response, status: status)
  end

  def login
    username = user_params[:username]
    @user = User.find_by(username: username)

    if @user.present? && @user.valid_password?(user_params[:password])
      @user.set_token
      response, status = format_success({ token: @user.token })
    else
      response, status = format_error('User or pass incorrect')
    end

    render(json: response, status: status)
  end

  def logout
    if current_user.remove_token
      response, status = format_success('logout OK!')
    else
      response, status = format_error(current_user.errors.full_messages)
    end

    render(json: response, status: status)
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
