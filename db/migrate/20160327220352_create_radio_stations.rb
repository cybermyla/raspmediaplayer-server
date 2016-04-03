class CreateRadioStations < ActiveRecord::Migration
  def change
    create_table :radio_stations do |t|
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
