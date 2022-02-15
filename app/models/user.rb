class User < ApplicationRecord

  def get_tests_by_level(level)
    Test.joins("JOIN processed_tests on tests.id = processed_tests.test_id ").where("processed_tests.user_id = ? and tests.level = ?", self.id, level)
  end
end
