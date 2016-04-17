class ChangeColumnNameonAvailabilities < ActiveRecord::Migration
  def change
  	rename_column :availabilities, :starttime, :start
  	rename_column :availabilities, :endtime, :end
  end
end
