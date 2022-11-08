# frozen_string_literal: true

class FinishTestsByCategoryRuleSpecification < AbstractRuleSpecification
  def satisfies?
    category = category_by_name(@value)
    return false if category.nil?

    ready_tests_ids = ready_tests_ids_by_category(category.id)
    return false if ready_tests_ids.empty?

    ready_tests_ids == successful_user_tests_ids_by_category(category.id)
  end

  private

  def category_by_name(category_name)
    Category.where(title: category_name).first
  end

  def ready_tests_ids_by_category(category_id)
    Test.where(category_id: category_id, ready: true).order('tests.id DESC').pluck(:id)
  end

  def successful_user_tests_ids_by_category(category_id)
    successful_user_tests_ids = []
    ready_user_tests_by_category(category_id).find_each do |user_test|
      if user_test.success? && successful_user_tests_ids.none?(user_test.test_id)
        successful_user_tests_ids << user_test.test_id
      end
    end
    successful_user_tests_ids
  end

  def ready_user_tests_by_category(category_id)
    @processed_test.user.tests.where(category_id: category_id, ready: true).order('processed_tests.test_id DESC')
  end
end
