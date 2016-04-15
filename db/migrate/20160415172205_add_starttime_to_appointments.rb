class AddStarttimeToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :starttime, :time
    add_column :appointments, :endtime, :time
  end
end
