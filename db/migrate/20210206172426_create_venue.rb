class CreateVenue < ActiveRecord::Migration[6.1]
  def change
    create_table :venues do |t|
      t.string :name, null: false, default: ""
      t.text :description, default: ""
      t.text :location

      t.timestamps
    end
  end
end
