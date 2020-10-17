class AddEndDateToWeeks < ActiveRecord::Migration[6.0]
  def change
    add_column :weeks, :end_date, :date, after: :start_date
  end
end
