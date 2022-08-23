# frozen_string_literal: true

class Question < ApplicationRecord

  has_many :answers, dependent: :delete_all
  has_many :gists, dependent: :delete_all
  belongs_to :test

  validates :body, presence: true

  def correct_answer
    answers.correct
  end
end
