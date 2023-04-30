# frozen_string_literal: true

class CreateStationStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :station_statuses do |t|
      t.integer :num_ebikes_available
      t.string :station_status
      t.integer :is_installed
      t.integer :num_bikes_disabled
      t.integer :num_bikes_available
      t.integer :num_docks_disabled
      t.integer :is_returning
      t.integer :is_renting
      t.boolean :eightd_has_available_keys
      t.string :legacy_id
      t.integer :num_docks_available
      t.integer :last_reported
      t.string :station_id
      t.datetime :requested_at

      t.timestamps
    end
  end
end
