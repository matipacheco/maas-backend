class CreateMonitoringSchemas < ActiveRecord::Migration[6.0]
  def change
    create_table :monitoring_schemas do |t|
      t.references :service, null: false, foreign_key: true
      t.json :structure

      t.timestamps
    end
  end
end
