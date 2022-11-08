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
    ready_user_tests_by_level(level) do |user_test|
      if user_test.success? && successful_user_tests_ids.none?(user_test.test_id)
        successful_user_tests_ids << user_test.test_id
      end
    end
    successful_user_tests_ids
  end

  def ready_tests_ids_by_level(level)
    Test.where(level: level, ready: true).order('tests.id DESC').pluck(:id)
  end

  def ready_user_tests_by_level(level)
    @processed_test.user.tests.where(level: level, ready: true).order('processed_tests.test_id DESC')
  end
end
