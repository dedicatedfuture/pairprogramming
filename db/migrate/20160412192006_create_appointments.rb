class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :start
      t.datetime :end

      t.timestamps null: false
    end
  end
end
