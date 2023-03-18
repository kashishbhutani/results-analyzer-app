class CreateResultsData < ActiveRecord::Migration[7.0]
  def change
    create_table :results_data do |t|
      t.string :subject
      t.float :marks
      t.datetime :timestamp
    end
  end
end
