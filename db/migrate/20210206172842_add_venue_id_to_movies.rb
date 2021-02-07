class AddVenueIdToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :venue_id, :integer
  end
end
