class CreateNumbers < ActiveRecord::Migration
  def change
    create_table :numbers do |t|
      t.integer :or
      t.string :bin
      t.string :rev
      t.integer :res

      t.timestamps null: false
    end
  end
end
