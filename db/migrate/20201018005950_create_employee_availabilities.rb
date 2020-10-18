class CreateEmployeeAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :employee_availabilities do |t|
      t.references :hour, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
