class CreateUsersAppointments < ActiveRecord::Migration
  def change
    create_table :users_appointments do |t|
      t.integer :user_id
      t.integer :appointment_id
      t.boolean :mentor

      t.timestamps null: false
    end
  end
end
