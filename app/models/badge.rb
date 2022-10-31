class Badge < ApplicationRecord
  has_many :given_badges, dependent: :destroy
  has_many :users, through: :given_badges

  validates :title, presence: true
  validates :rule_type, presence: true



end
