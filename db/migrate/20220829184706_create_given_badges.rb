class CreateGivenBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :given_badges do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :badge, foreign_key: true
      t.timestamps
    end
  end
end
