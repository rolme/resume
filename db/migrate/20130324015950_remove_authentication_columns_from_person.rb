class RemoveAuthenticationColumnsFromPerson < ActiveRecord::Migration
  def up
    remove_column :people, :email
    remove_column :people, :reset_password_token
    remove_column :people, :reset_password_sent_at
    remove_column :people, :remember_created_at
    remove_column :people, :sign_in_count
    remove_column :people, :current_sign_in_at
    remove_column :people, :last_sign_in_at
    remove_column :people, :current_sign_in_ip
    remove_column :people, :last_sign_in_ip
    remove_column :people, :encrypted_password
  end

  def down
    add_column :people, :last_sign_in_ip, :string
    add_column :people, :current_sign_in_ip, :string
    add_column :people, :last_sign_in_at, :string
    add_column :people, :current_sign_in_at, :string
    add_column :people, :sign_in_count, :string
    add_column :people, :remember_created_at, :string
    add_column :people, :reset_password_sent_at, :string
    add_column :people, :reset_password_token, :string
    add_column :people, :email, :string
  end
end
