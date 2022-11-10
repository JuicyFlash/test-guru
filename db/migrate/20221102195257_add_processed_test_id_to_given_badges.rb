class AddProcessedTestIdToGivenBadges < ActiveRecord::Migration[6.1]
  def change
    add_reference(:given_badges, :processed_test, foreign_key: { to_table: :processed_tests })
  end
end
