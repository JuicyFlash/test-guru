# frozen_string_literal: true

class ProcessedTest < ApplicationRecord

  PERCENT_FOR_PASS_TEST = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  has_many :given_badges, class_name: 'GivenBadge'
  has_many :badges, through: :given_badges
  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update
  after_validation :after_validation_set_successful, on: :update

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer? (answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def success?
    percent_result >= PERCENT_FOR_PASS_TEST
  end

  def percent_result
    (self.correct_questions.to_f / test.questions.count * 100).to_i
  end

  def time_to_complete
    time_to_pass = self.test.time_to_pass
    return -1 if time_to_pass.zero?

    time_left = time_to_pass - (Time.current - created_at)

    return 0 if time_left.negative?

    time_left
  end

  private

  def before_validation_set_next_question
    self.current_question = next_question
    self.question_number += 1 if question_number < test.questions.count
  end

  def before_validation_set_first_question
    self.current_question = self.test.questions.first if test.present?
  end

  def after_validation_set_successful
    self.successful = success? if completed?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.correct_answer
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
