# frozen_string_literal: true

class Question < ApplicationRecord

  has_many :answers
  has_many :gists
  belongs_to :test

  validates :body, presence: true

  def correct_answer
    answers.correct
  end
end
