class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name 
      t.belongs_to :gametype, index: true
      t.string :winner
      
      t.timestamps null: false
    end
  end
end
