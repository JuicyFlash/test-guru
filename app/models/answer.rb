# frozen_string_literal: true

class Answer < ApplicationRecord

  belongs_to :question

  validates :body, presence: true



  validate :validate_count_on_update, on: :update
  validate :validate_count_on_create, on: :create

  scope :correct, -> { where(correct: :true) }

  private

  def validate_count_on_update
    count = Answer.where('question_id = ?', question_id).count
    errors.add(:answers_count, 'wrong count') if count > 4
  end

  def validate_count_on_create
    count = Answer.where('question_id = ?', question_id).count
    errors.add(:answers_count, 'wrong count') if count >= 4
  end

end
