# frozen_string_literal: true

class Question < ApplicationRecord

  has_many :answers
  belongs_to :test

  validates :body, presence: true
  validate :validate_answers_count

  def correct_answer
    answers.correct
  end

  private

  def validate_answers_count
    count = answers.count
    errors.add :answers_count, 'wrong count' if count < 1 || count > 4
  end

end
