# frozen_string_literal: true

class AddSuccessfulToProcessedTests < ActiveRecord::Migration[6.1]
  def change
    add_column :processed_tests, :successful, :bool, default: false
  end
end
