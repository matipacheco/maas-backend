# frozen_string_literal: true

class CreateMonitoringShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :monitoring_shifts do |t|
      t.references :service
      t.references :week
      t.json :structure

      t.timestamps
    end
  end
end
