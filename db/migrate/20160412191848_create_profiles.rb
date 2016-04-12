class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :fname
      t.string :lname
      t.text :bio
      t.text :workexp
      t.text :teachexp
      t.text :skillexp

      t.timestamps null: false
    end
  end
end
