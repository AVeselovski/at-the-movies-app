class AddFieldsToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :showings, :integer
    add_column :movies, :cancelled, :boolean
  end
end
