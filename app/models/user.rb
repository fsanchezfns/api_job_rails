class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :password, length: { minimum: 8 }    

    before_create :set_token

    def set_token
        self.token = SecureRandom.urlsafe_base64
    end


    def valid_password?(pass)
        password.present? && password == pass
    end
end
