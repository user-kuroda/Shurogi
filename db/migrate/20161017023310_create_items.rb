class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :itemname
      t.binary :image
      t.binary :image2
      t.binary :image3
      t.boolean :itemcall
      t.boolean :situ
      t.string :ani
      t.date :day
      t.string :category
      t.boolean :fav
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
