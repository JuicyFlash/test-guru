class BadgeService
  RULES = {finish_tests_by_category:FinishTestsByCategoryRuleSpecification,
           finish_tests_by_level:FinishTestsByLevelRuleSpecification,
           finish_any_test_by_first_try:FinishAnyTestByFirstTryRuleSpecification}.freeze
  def initialize(processed_test)
    @processed_test = processed_test
    @given_badges = []
  end

  def self.rules
    rule_description = {}
    RULES.each  do |rule_id, rule|
      rule_description[rule_id] = rule.description
    end
    rule_description
  end

  def call
    Badge.all.each do |badge|
        rule = RULES[badge.rule_type.to_sym].new(value: badge.rule_value, processed_test: @processed_test)
          add_badge(badge) if rule.satisfies?
    end
    @given_badges
  end
  def add_badge(badge)
    if (@processed_test.user.badges.where("badge_id=?", badge.id).empty? && badge.unique) || !badge.unique
      @processed_test.user.badges << badge
      @given_badges << badge
    end
  end
end
