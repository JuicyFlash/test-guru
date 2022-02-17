# frozen_string_literal: true

class Answer < ApplicationRecord

  belongs_to :question

  validates :body, presence: true

  validate :validate_count, on: :create

  scope :correct, -> { where(correct: :true) }

  private

  def validate_count
    count = question.answers.count
    errors.add(:answers_count, 'wrong count') if count >= 4
  end

end
