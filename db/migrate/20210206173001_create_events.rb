class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.date :event_date
      t.time :event_time
      t.integer :venue_id

      t.timestamps
    end
  end
end
