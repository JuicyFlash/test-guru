# frozen_string_literal: true

class FinishTestsByCategoryRuleSpecification < AbstractRuleSpecification
  def satisfies?
    category = category_by_name(@value)
    return false if category.nil?

    ready_tests_ids = ready_tests_ids_by_category(category.id)
    return false if ready_tests_ids.empty?

    ready_tests_ids == user_processed_tests_by_category(category.id).select(&:success?).pluck(:test_id).uniq
  end

  private

  def category_by_name(category_name)
    Category.find_by(title: category_name)
  end

  def ready_tests_ids_by_category(category_id)
    Test.where(category_id: category_id, ready: true).order('tests.id DESC').pluck(:id)
  end

  def user_processed_tests_by_category(category_id)
    ProcessedTest.joins('join tests on tests.id=processed_tests.test_id')
                 .where(user_id: @processed_test.user_id, tests: { category_id: category_id }, tests: { ready: true })
                 .order('processed_tests.test_id DESC')
  end
end

