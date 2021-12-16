class Enterprise < ApplicationRecord
  belongs_to :user

  validates :name, :nationality, presence: true
  validates :user, uniqueness: true

  def json
    { name: name, nationality: nationality}
  end
end
