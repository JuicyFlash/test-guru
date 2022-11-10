# frozen_string_literal: true

class FinishAnyTestByFirstTryRuleSpecification < AbstractRuleSpecification
  def satisfies?
    return false unless @processed_test.success?

    ProcessedTest.where(user_id: @processed_test.user_id, test_id: @processed_test.test_id).count == 1
  end
end
