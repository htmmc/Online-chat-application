class AddAvailabilityToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :ready, :boolean
  end
end
