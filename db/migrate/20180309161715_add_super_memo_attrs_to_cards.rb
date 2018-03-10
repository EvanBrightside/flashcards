class AddSuperMemoAttrsToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :ef, :float, default: 1.3
  end
end
