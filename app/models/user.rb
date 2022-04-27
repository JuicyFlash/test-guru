# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :confirmable,
         :validatable

  has_many :processed_tests
  has_many :tests, through: :processed_tests

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Incorrect email format", on: :create },
            uniqueness: { message: "Email already in use" }


  def get_tests_by_level(level)
    Test.joins("JOIN processed_tests on tests.id = processed_tests.test_id ").where("processed_tests.user_id = ? and tests.level = ?", self.id, level)
  end

  def processed_test(test)
    processed_tests.order(id: :desc).find_by(test_id: test.id)
  end

end
