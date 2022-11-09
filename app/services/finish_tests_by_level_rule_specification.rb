# frozen_string_literal: true

class FinishTestsByLevelRuleSpecification < AbstractRuleSpecification
  def satisfies?
    ready_tests_ids = ready_tests_ids_by_level(@value)
    if ready_tests_ids.empty?
      false
    else
      ready_tests_ids == user_processed_tests_by_level(@value).select(&:success?).pluck(:test_id).uniq
    end
  end

  private

  def ready_tests_ids_by_level(level)
    Test.where(level: level, ready: true).order('tests.id DESC').pluck(:id)
  end

  def user_processed_tests_by_level(level)
    ProcessedTest.joins('join tests on tests.id=processed_tests.test_id')
                 .where(user_id: @processed_test.user_id, tests: { level: level }, tests: { ready: true })
                 .order('processed_tests.test_id DESC')
  end
end
