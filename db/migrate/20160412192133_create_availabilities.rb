class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.integer :day
      t.time :starttime
      t.time :endtime
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
