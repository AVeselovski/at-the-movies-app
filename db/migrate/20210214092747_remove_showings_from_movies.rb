class RemoveShowingsFromMovies < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :showings, :integer
    remove_column :movies, :cancelled, :boolean
  end
end
