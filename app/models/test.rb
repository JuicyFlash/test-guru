# frozen_string_literal: true

class Test < ApplicationRecord

  has_many :questions, dependent: :delete_all
  has_many :processed_tests, dependent: :delete_all
  has_many :users, through: :processed_tests
  belongs_to :category
  belongs_to :author, class_name: "User" , foreign_key: :author_id

  validates :title, presence: true, uniqueness: { scope: :level,
                                                  message: 'level and title must be uniq'}
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :mid, -> { where(level: 2..4) }
  scope :hard, -> { where('level >= 5') }

  def self.titles_by_category(category)
    Test.joins("JOIN categories on tests.category_id = categories.id ").where("categories.title = ?", category).order('tests.title DESC').pluck(:title)
  end
end
