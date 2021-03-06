class ApplicationController < ActionController::API

  def check_candidate
    if check_token && !current_candidate?
      response, status = format_error('user not candidate')
      render(json: response, status: status)
    end
  end


  def check_enterprise
    if check_token && !current_enterprise?
      response, status = format_error('user not enterprise')
      render(json: response, status: status)
    end
  end
  
  def check_token
    if current_user.present?
      true
    else
      response, status = format_error('token invalid')
      render(json: response, status: 401)
      false
    end
  end

  def current_user
    @current_user ||= User.find_by(token: header_token)
  end

  def header_token
    request.headers['Authorization'].split(' ').last
  end

  def current_enterprise?
    @current_enterprise = current_user.enterprise
    @current_enterprise.present?
  end

  def current_candidate?
    @current_candidate = current_user.candidate
    @current_candidate.present?
  end

  def user_registered?
    (current_enterprise? || current_candidate?)
  end

  # error or sucess
  def format_error(dsc)
    error = [{ messages: [{ descriptions: dsc }] }, 400]
  end

  def format_success(data)
    sucess = [data, 200]
  end
end
