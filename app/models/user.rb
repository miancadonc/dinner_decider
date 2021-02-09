class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :email, uniqueness: { message: "Email already taken" }
    
end