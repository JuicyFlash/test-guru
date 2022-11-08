# frozen_string_literal: true

class FinishAnyTestByFirstTryRuleSpecification < AbstractRuleSpecification
  def satisfies?
    if @processed_test.success?
      ProcessedTest.where('user_id=? and test_id=? and id<>?', @processed_test.user_id, @processed_test.test_id,
                          @processed_test.id).empty?
    else
      false
    end
  end
end
