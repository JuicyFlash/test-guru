# frozen_string_literal: true

class FinishTestsByLevelRuleSpecification < AbstractRuleSpecification
  def satisfies?
    ready_tests_ids = ready_tests_ids_by_level(@value)
    if ready_tests_ids.empty?
      false
    else
      ready_tests_ids == successful_user_tests_ids_by_level(@value)
    end
  end

  private

  def successful_user_tests_ids_by_level(level)
    successful_user_tests_ids = []
    user_processed_tests_by_level(level) do |processed_test|
      if processed_test.success? && successful_user_tests_ids.none?(processed_test.test_id)
        successful_user_tests_ids << processed_test.test_id
      end
    end
    successful_user_tests_ids
  end

  def ready_tests_ids_by_level(level)
    Test.where(level: level, ready: true).order('tests.id DESC').pluck(:id)
  end

  def user_processed_tests_by_level(level)
    ProcessedTest.joins('join tests on tests.id=processed_tests.test_id')
                 .where('processed_tests.user_id=? and tests.level=? and tests.ready=true', @processed_test.user_id, level)
                 .order('processed_tests.test_id DESC')
  end
end
