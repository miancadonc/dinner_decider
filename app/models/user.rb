class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    # validates :email, uniqueness: { message: "Email already taken" }

    def self.create_from_omniauth(auth_hash)
        
        @user = User.create do |user|
            user.name = auth_hash[:info][:name]
            user.email = auth_hash[:info][:email]
            user.uid = auth_hash[:uid]
            user.provider = auth_hash[:provider]
            user.password = auth_hash[:credentials][:token]
        end

    end
    
end