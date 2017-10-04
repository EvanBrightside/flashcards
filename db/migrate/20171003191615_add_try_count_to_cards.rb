class AddTryCountToCards < ActiveRecord::Migration[5.0]
  def self.up
    add_column :cards, :try_count, :integer, default: 0
  end

  def self.down
    remove_column :cards, :try_count
  end
end
