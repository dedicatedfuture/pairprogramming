class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
    	t.time :start
    	t.time :end
    	t.integer :dow
    end
  end
end
