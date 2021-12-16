class V1::CandidatesController < ApplicationController
  before_action :check_token

  def index
    if current_candidate?
      response, status = format_success(@current_candidate.json)
    else
      response, status = format_error('user without candidate or register with enterprise')
    end

    render(json: response, status: status)
  end

  def create
    if user_registered?
      response, status = format_error('the user is registered')
    else  
      @candidate = Candidate.new(candidate_params)
      @candidate.user = @current_user
      if @candidate.save
        response, status = format_success(@candidate.to_json)
      else
        response, status = format_error(@candidate.errors.full_messages)
      end
    end
    render(json: response, status: status)
  end

  def update; end

  private

  def candidate_params
    params.require(:candidate).permit(:name, :lastname, :birth_date, :observations)
  end
end
