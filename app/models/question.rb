# frozen_string_literal: true

class Question < ApplicationRecord

  has_many :answers, dependent: :destroy
  has_many :gists, dependent: :destroy
  belongs_to :test

  validates :body, presence: true

  def correct_answer
    answers.correct
  end
end
