class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :role
      t.string :name
      t.timestamps
    end
  end
end
