class AddInfoToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :info, :text
  end
end
