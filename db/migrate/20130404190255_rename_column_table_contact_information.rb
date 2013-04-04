class RenameColumnTableContactInformation < ActiveRecord::Migration
  def change
    rename_column :contact_informations, :middile_initial, :middle_initial
  end
end
