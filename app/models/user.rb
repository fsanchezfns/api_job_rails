class User < ApplicationRecord
  has_one :enterprise
  has_one :candidate
  
  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }

  def set_token
    update(token: SecureRandom.urlsafe_base64)
  end

  def remove_token
    update(token: nil)
  end

  def valid_password?(pass)
    password.present? && password == pass
  end


  def json
    {username: username}
  end
end
