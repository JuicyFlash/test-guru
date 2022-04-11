class AddProcessedTestsAttributes < ActiveRecord::Migration[6.1]
  def change
    add_reference(:processed_tests, :current_question, foreign_key: { to_table: :questions })
    add_column :processed_tests, :correct_questions, :integer, default: 0
    add_column :processed_tests, :question_number, :integer, default: 1
  end
end
