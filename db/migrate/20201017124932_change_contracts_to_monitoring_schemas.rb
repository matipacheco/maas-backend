class ChangeContractsToMonitoringSchemas < ActiveRecord::Migration[6.0]
  def change
    rename_table :contracts, :monitoring_schemas

    add_column :monitoring_schemas, :structure, :json, after: :service_id
  end
end
