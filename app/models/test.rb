# frozen_string_literal: true

class Test < ApplicationRecord

  has_many :questions
  has_many :processed_tests
  has_many :users, through: :processed_tests
  belongs_to :category
  belongs_to :author, class_name: "User" , foreign_key: :author_id

  def self.titles_by_category(category)
    Test.joins("JOIN categories on tests.category_id = categories.id ").where("categories.title = ?", category).order('tests.title DESC').pluck(:title)
  end
end
