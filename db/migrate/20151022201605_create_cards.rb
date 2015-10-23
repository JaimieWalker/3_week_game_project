class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :value
      t.belongs_to :user, index: true 
      t.timestamps null: false
    end
  end
end