# frozen_string_literal: true

class Badge < ApplicationRecord
  RULES_DESCRIPTIONS = %i[finish_tests_by_category
                          finish_tests_by_level
                          finish_any_test_by_first_try].freeze

  has_many :given_badges, dependent: :destroy
  has_many :users, through: :given_badges

  validates :title, presence: true
  validates :rule_type, presence: true

  def self.rules_descriptions
    RULES_DESCRIPTIONS.map { |value| [value, get_rule_description(value)] }.to_h
  end

  def self.get_rule_description(value)
    I18n.translate("rule_specification.#{value}")
  end
end
