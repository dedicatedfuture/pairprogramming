class AddSkypeToProfile < ActiveRecord::Migration
  def change
  	add_column :profiles, :skype, :string
  end
end
