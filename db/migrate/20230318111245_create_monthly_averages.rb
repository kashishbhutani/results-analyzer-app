class CreateMonthlyAverages < ActiveRecord::Migration[7.0]
  def change
    create_table :monthly_averages do |t|
      t.string :date
      t.string :subject
      t.float :monthly_avg_low
      t.float :monthly_avg_high
      t.integer :monthly_result_count_used
    end
  end
end
