class Subscription < ApplicationRecord
  belongs_to :job
  belongs_to :candidate

  STATE = { i: 'interested', c: 'contracted', r: 'rejected' }.freeze

  #def json
  #  { id: id, job_id: job_id, candidate_id: candidate_id, state: state }
  #end


  def json
    { job: Job.find_by(id:job_id).json, state: state }
  end
end
