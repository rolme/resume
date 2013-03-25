class CreateContactInformations < ActiveRecord::Migration
  def change
    create_table :contact_informations do |t|
      t.references :contact_type
      t.string :information, :limit => 64

      t.timestamps
    end
  end
end
