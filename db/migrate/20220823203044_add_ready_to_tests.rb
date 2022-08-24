class AddReadyToTest < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :ready, :bool, default: 0
  end
end
