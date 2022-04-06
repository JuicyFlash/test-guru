# frozen_string_literal: true

class User < ApplicationRecord

  has_many :processed_tests
  has_many :tests, through: :processed_tests

  validates :email, presence: true

  def processed_test(test)
    processed_tests.order(id: :desc).find_by(test_id: test.id)
  end

  def get_tests_by_level(level)
    Test.joins("JOIN processed_tests on tests.id = processed_tests.test_id ").where("processed_tests.user_id = ? and tests.level = ?", self.id, level)
  end
end
