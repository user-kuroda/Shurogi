class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :userid
      t.string :name
      t.string :pass
      t.string :mail
      t.string :mailback
      t.string :color
      t.integer :call
      t.integer :count, :default => 0

      t.timestamps null: false
    end
  end
end
