class User < ActiveRecord::Base

	has_secure_password 

	validates :email, presence: true, uniqueness: true
	validates :password, length: { within: 8..16 }
end
