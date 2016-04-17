class RemoveStarttimeFromAppointments < ActiveRecord::Migration
  def change
  	remove_column :appointments, :starttime 
  	remove_column :appointments, :endtime
  end
end
