class V1::UsersController < ApplicationController
  def index
    @user = User.all
    render(json:@user)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      response, status = format_success(@user.to_json(only:[:username,:token]))
    else
      response, status = format_error(@user.errors)
    end  

    render(json:response,status:status)
  end

  def login 
    username= user_params[:username]
    @user = User.find_by(username: username)

    if @user.present? && @user.valid_password?(user_params[:password])
      response, status = format_success({token:@user.token})
    else
      response, status = format_error("User or pass incorrect")
    end 

    render(json:response,status:status)
  end


  def logout
    
  end

  def user_params
    params.require(:user).permit(:username,:password)
  end 

  def format_error(dsc)
    error = [{messages:[{descriptions:dsc}]},400]
  end
  
  def format_success(data)
    sucess = [data,200]
  end 


  
end
