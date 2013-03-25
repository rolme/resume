class UpdateColumnsForPeople < ActiveRecord::Migration
  def up
  	change_column :people, :first_name, :string, :limit => 64
  	change_column :people, :last_name, :string, :limit => 64
  	change_column :people, :type, :string, :limit => 64
  	remove_column :people, :handle
  end

  def down
  end
end
