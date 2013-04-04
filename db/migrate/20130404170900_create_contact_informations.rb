class CreateContactInformations < ActiveRecord::Migration
  def change
    create_table :contact_informations do |t|
      t.string :first_name
      t.string :last_name
      t.string :middile_initial, :limit => 1
      t.string :home_phone
      t.string :mobile_phone
      t.string :contact_email
      t.string :url
      t.string :github
      t.string :linkedin
      t.string :twitter
      t.string :instagram
      t.string :facebook

      t.timestamps
    end
  end
end
