class DropColumnsFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :authenticationable_id
    remove_column :users, :authenticationable_type
  end

  def down
  end
end
