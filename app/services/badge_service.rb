# frozen_string_literal: true

class BadgeService
  RULES = { finish_tests_by_category: FinishTestsByCategoryRuleSpecification,
            finish_tests_by_level: FinishTestsByLevelRuleSpecification,
            finish_any_test_by_first_try: FinishAnyTestByFirstTryRuleSpecification }.freeze

  def initialize(processed_test)
    @processed_test = processed_test
  end

  def call
    given_badges = []
    Badge.all.find_each do |badge|
      rule = RULES[badge.rule_type.to_sym].new(value: badge.rule_value, processed_test: @processed_test)
      given_badges << given_badge(badge) if rule.satisfies? && unique_satisfies?(badge)
    end
    add_badges(given_badges)
  end

  private

  def add_badges(given_badges)
    GivenBadge.insert_all(given_badges) if given_badges.length.positive?
  end

  def given_badge(badge)
    { user_id: @processed_test.user.id, processed_test_id: @processed_test.id, badge_id: badge.id,
      created_at: DateTime.now, updated_at: DateTime.now }
  end

  def unique_satisfies?(badge)
    (@processed_test.user.badges.where(id: badge.id).empty? && badge.unique) || !badge.unique
  end
end
