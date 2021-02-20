class AddFieldsToMovie < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :added_by, :integer
    add_column :movies, :is_disabled, :boolean
    add_column :movies, :disabled_reason, :text
  end
end
