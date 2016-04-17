class ChangeColumnNameDayonAvailabilities < ActiveRecord::Migration
  def change
  	rename_column :availabilities, :day, :dow
  end
end
