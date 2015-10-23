class User < ActiveRecord::Base


  belongs_to :room
  has_many :cards
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, length: { within: 8..16 }
  
 

end
