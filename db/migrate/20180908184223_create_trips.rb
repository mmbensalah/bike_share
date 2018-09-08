class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.integer :duration
      t.datetime :start_date
      t.datetime :end_date
      t.integer :bike_id
      t.string :subscription_type
      t.integer :zip_code
      t.references :start_station, index: true, foreign_key: {to_table: :stations}
      t.references :end_station, index: true, foreign_key: {to_table: :stations}
      t.timestamps
    end
  end
end
