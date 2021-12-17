class Job < ApplicationRecord
  belongs_to :enterprise

  validates :name, presence: true, length: { maximum: 30 }
  validates :description, :requirements, presence: true, length: { in: 20..600 }
  # validates :enterprise, presence: true

  def json
    { id: id, name: name, description: description, requirements: requirements, time: time, enable: enable }
  end
end
