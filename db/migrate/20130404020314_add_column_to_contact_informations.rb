class AddColumnToContactInformations < ActiveRecord::Migration
  def change
    remove_column :users, :user_id
    add_column :contact_informations, :user_id, :integer
  end
end
