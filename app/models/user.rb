# frozen_string_literal: true
require 'digest/sha1'
class User < ApplicationRecord

  has_many :processed_tests
  has_many :tests, through: :processed_tests

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Incorrect email format", on: :create }
  validates :email, uniqueness: { message: "Email already in use" }

  has_secure_password

  def get_tests_by_level(level)
    Test.joins("JOIN processed_tests on tests.id = processed_tests.test_id ").where("processed_tests.user_id = ? and tests.level = ?", self.id, level)
  end

  def processed_test(test)
    processed_tests.order(id: :desc).find_by(test_id: test.id)
  end

end
