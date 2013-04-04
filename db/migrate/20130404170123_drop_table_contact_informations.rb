class DropTableContactInformations < ActiveRecord::Migration
  def up
    drop_table :contact_informations
    drop_table :contact_types
  end
end
