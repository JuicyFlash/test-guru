class CreateGists < ActiveRecord::Migration[6.1]
  def change
    create_table :gists do |t|
      t.string :url
      t.timestamps
      t.references :author, foreign_key: { to_table: :users }
      t.references :question, foreign_key: { to_table: :questions }
    end
  end
end
