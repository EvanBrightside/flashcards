class SorceryRememberMe < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :remember_me_token, :string, :default => nil
    add_column :users, :remember_me_token_expires_at, :datetime, :default => nil

    add_index :users, :remember_me_token
  end

  def down
    remove_index :users, :remember_me_token

    remove_column :users, :remember_me_token_expires_at, :datetime
    remove_column :users, :remember_me_token, :string
  end
end
