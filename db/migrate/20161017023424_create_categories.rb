class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :categoryname
      t.integer :user_id
      t.boolean :dcheck

      t.timestamps null: false
    end
  end
end
