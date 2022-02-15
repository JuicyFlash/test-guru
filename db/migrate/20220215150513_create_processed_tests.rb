class CreateProcessedTests < ActiveRecord::Migration[6.1]
  def change
    create_table :processed_tests do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :test, foreign_key: true

      t.timestamps
    end
  end
end
