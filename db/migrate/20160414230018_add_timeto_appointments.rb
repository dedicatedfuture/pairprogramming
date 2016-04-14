class AddTimetoAppointments < ActiveRecord::Migration
  def change
  	add_column :appointments, :starttime, :integer
  	add_column :appointments, :endtime, :integer
  end
end
