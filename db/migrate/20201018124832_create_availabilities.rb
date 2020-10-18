# frozen_string_literal: true

class CreateAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :availabilities do |t|
      t.references :week, null: false, foreign_key: true
      t.integer :day
      t.integer :hour
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
