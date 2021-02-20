class AddSelectedVenueToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :selected_venue, :integer
  end
end
