class CreateVenueUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :venue_users do |t|
      t.integer :venue_id
      t.integer :user_id
      t.boolean :is_owner, default: false

      t.timestamps
    end
  end
end
