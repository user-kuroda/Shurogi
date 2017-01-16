class CreateHowTos < ActiveRecord::Migration
  def change
    create_table :how_tos do |t|
      t.binary :htimg1
      t.binary :htimg2
      t.binary :htimg3

      t.timestamps null: false
    end
  end
end
