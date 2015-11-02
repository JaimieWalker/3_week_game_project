class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :password_digest
      t.string :email

      t.belongs_to :game, index: true
      t.boolean :dealer, default: false
      t.boolean :bust , default: false
      t.boolean :stay , default: false
      t.integer :total_value, default: 0
      

      t.timestamps null: false
    end
  end
end
