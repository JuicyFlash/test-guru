class CreateGists < ActiveRecord::Migration[6.1]
  def change
    create_table :gists do |t|
      t.string :url
      t.timestamps
    end
    add_reference(:gists, :question, foreign_key: { to_table: :questions })
    add_reference(:gists, :author, foreign_key: { to_table: :users })
  end
end
