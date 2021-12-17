class Subscription < ApplicationRecord
  belongs_to :job
  belongs_to :candidate

  STATE = { i: 'interested', c: 'contracted', r: 'rejected' }.freeze

  #def json
  #  { id: id, job_id: job_id, candidate_id: candidate_id, state: state }
  #end


  def json
    { id: id, state: state, job: Job.find_by(id:job_id).json}
  end

  def jsonfull
    { id: id, state: state, job: Job.find_by(id:job_id).json, candidate: Candidate.find_by(id:candidate_id)}
  end
end
