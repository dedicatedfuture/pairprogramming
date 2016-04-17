class ChangeDowcolumnonAvailabilities < ActiveRecord::Migration
  def change

  	change_column :availabilities, :dow, :column, array: true, default: []
  end
end
