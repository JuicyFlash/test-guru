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
  has_many :given_badges
  has_many :badges, through: :given_badges
  has_many :author_gists, class_name: "Gist" , foreign_key: :author_id
  has_many :author_tests, class_name: "Test" , foreign_key: :author_id

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Incorrect email format", on: :create },
            uniqueness: { message: "Email already in use" }


  def get_tests_by_level(level)
    Test.joins("JOIN processed_tests on tests.id = processed_tests.test_id ").where("processed_tests.user_id = ? and tests.level = ?", self.id, level)
  end

  def name_for_greeting
    if (first_name || self.last_name).nil?
      self.email
    else
      [self.first_name, self.last_name].compact.join(' ')
    end

  end

  def admin?
    self.is_a?(Admin)
  end

  def processed_test(test)
    processed_tests.order(id: :desc).find_by(test_id: test.id)
  end

end
