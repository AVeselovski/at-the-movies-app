class AddFieldsToEvents2 < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :showings, :integer
    add_column :events, :cancelled, :boolean
  end
end
