class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title, null: false, default: ""
      t.text :description, default: ""
      t.integer :year_of_release
      t.date :watched_at

      t.timestamps
    end
  end
end
