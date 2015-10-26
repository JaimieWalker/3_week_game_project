class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :value
      t.string :suit
      t.boolean :drawn, default: false
      t.timestamps null: false
    end
  end
end