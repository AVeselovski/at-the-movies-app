class ChangeFieldInMovies < ActiveRecord::Migration[6.1]
  def change
    change_column :movies, :is_disabled, :boolean, :default => false
    change_column :movies, :disabled_reason, :text, :default => ""
  end
end
