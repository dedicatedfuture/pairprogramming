class CreateTableAvailabilities < ActiveRecord::Migration
  def change
    create_table :table_availabilities do |t|
    	t.time :start
    	t.time :end
    	t.string :dow, array:true, default: []
    end
  end
end
