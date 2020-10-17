class CreateContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :contracts do |t|
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
