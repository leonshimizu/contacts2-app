class AddressBackToCoordinates < ActiveRecord::Migration[6.1]
  def change
    remove_column :contacts, :address, :string
    add_column :contacts, :latitude, :float
    add_column :contacts, :longitude, :float
  end
end
