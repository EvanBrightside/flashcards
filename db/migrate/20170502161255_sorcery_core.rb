class SorceryCore < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :salt, :string
    add_column :users, :name, :string
    add_index :users, :email, unique: true
    rename_column :users, :password, :crypted_password
  end

  def down
    rename_column :users, :crypted_password, :password
    remove_index :users, :email
    remove_column :users, :name, :string
    remove_column :users, :salt, :string
  end
end
