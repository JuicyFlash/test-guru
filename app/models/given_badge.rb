# frozen_string_literal: true
class GivenBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge
  belongs_to :processed_test, class_name: "ProcessedTest"
end
