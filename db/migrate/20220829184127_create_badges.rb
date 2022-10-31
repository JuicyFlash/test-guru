class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :rule_type, null: false
      t.boolean :unique, null: false, default: false
      t.string :picture
      t.string :rule_value
      t.string :rule_description
      t.timestamps
    end
  end
end
