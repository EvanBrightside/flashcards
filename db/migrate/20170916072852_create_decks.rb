class CreateDecks < ActiveRecord::Migration[5.0]
  def up
    create_table :decks do |t|
      t.string :name
      t.references :user, foreign_key: true
    end

    add_reference :cards, :deck, foreign_key: true
  end

  def down
    remove_column :cards, :deck_id

    drop_table :decks
  end
end

