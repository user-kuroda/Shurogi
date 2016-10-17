class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :itemname
      t.boolean :itemcall
      t.boolean :situ
      t.string :ani
      t.date :day
      t.string :category
      t.boolean :fav
      t.string :user_id

      t.timestamps null: false
    end
  end
end
