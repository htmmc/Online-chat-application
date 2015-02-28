class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :birthday, :date
	add_column :users, :name, :string
	add_column :users, :agegroup, :string
	add_column :users, :license, :boolean
	add_column :users, :license_type, :string
	add_column :users, :registration, :boolean
	add_column :users, :registration_type, :string
	add_column :users, :religion, :string
	add_column :users, :specialty, :string
	add_column :users, :categories, :string 
	add_column :users, :description, :text
	add_column :users, :beginning_of_available_time, :datetime
	add_column :users, :end_of_available_time, :datetime
  end
end
