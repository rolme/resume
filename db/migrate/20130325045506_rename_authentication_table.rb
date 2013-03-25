class RenameAuthenticationTable < ActiveRecord::Migration
  def up
    rename_table :authentications, :users
  end

  def down
  end
end
