class SorceryExternal < ActiveRecord::Migration[5.0]
  def up
    create_table :authentications do |t|
      t.integer :user_id, null: false
      t.string :provider, :uid, null: false

      t.timestamps
    end

    add_index :authentications, [:provider, :uid]
  end

  def down
    remove_index :authentications, [:provider, :uid]

    drop_table :authentications
  end
end
