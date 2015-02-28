class AddMoreInfoToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :username, :string
  	add_column :users, :language, :string
  	add_column :users, :term_agreement, :boolean
  	add_column :users, :listener, :boolean

  end
end
