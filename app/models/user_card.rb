class UserCard < ActiveRecord::Base
  belongs_to :user
  belongs_to :card

  def self.restart(users)
    users.each do |user|
      UserCard.where(user_id: user.id).destroy_all
      user.update_columns(total_value: 0, stay: false )
    end
    Card.reset
  end
end
