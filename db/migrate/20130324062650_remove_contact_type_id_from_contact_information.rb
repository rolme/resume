class RemoveContactTypeIdFromContactInformation < ActiveRecord::Migration
  def up
    remove_column :contact_informations, :contact_type_id
    add_column :contact_informations, :contact_type_id, :integer
  end

  def down
    add_column :contact_informations, :contact_type_id, :string
  end
end
