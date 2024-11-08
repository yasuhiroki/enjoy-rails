class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :jwt_authenticatable, jwt_revocation_strategy: self
#  include DeviseTokenAuth::Concerns::User
end
