class CreateMovieVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :movie_votes do |t|
      t.integer :movie_id
      t.integer :user_id

      t.timestamps
    end
  end
end
