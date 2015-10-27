class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.string :value
      t.string :suit
      t.boolean :drawn, default: false
      t.timestamps null: false
      t.belongs_to :user, index: true
    end
  end
end
