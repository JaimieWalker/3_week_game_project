class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      
    	t.string :first_name
    	t.string :last_name
    	t.string :email
    	t.string :password_digest
      t.belongs_to :room, index: true
      t.integer :card_id

      t.timestamps null: false
    end
  end
end
