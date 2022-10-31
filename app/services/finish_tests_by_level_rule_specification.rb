class FinishTestsByLevelRuleSpecification < AbstractRuleSpecification

  def self.description
    "За успешное прохождение тестов заданного уровня"
  end

  def satisfies?
    tests = Test.where("level=? and ready=true", @value).order('tests.id DESC').pluck(:id)
    user_tests = []
    ProcessedTest.joins("join tests on tests.id=processed_tests.test_id").
                  where("processed_tests.user_id=? and tests.level=? and tests.ready=true" , @processed_test.user_id, @value).
                  order('processed_tests.test_id DESC').each  do |processed_test|
      user_tests << processed_test.test_id if processed_test.success?
    end
    if tests.empty?
      false
    else
      tests == user_tests
    end
  end

end
