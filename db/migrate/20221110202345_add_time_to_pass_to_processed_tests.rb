class AddTimeToPassToProcessedTests < ActiveRecord::Migration[6.1]
  def change
    add_column :processed_tests, :time_to_pass, :integer, default: 0
  end
end
