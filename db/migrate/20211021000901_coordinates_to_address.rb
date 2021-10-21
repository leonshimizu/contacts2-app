class CoordinatesToAddress < ActiveRecord::Migration[6.1]
  def change
    remove_column :contacts, :longitude, :float
    remove_column :contacts, :latitude, :float
    add_column :contacts, :address, :string
  end
end
