class Candidate < ApplicationRecord
  belongs_to :user

  validates :name, :lastname, presence: true, length: { maximum: 40 }
  #validates :birth_date, presence: true
  validates :observations, length: { maximum: 255 }
  validates :user, uniqueness: true
  
  def json
    {id: id, name: name, lastname: lastname, birth_date: birth_date, observations: observations}
  end
end
