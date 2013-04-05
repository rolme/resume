class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state, :limit => 2
      t.string :zip, :limit => 5
      t.string :county
      t.references :user

      t.timestamps
    end
    add_index :addresses, :user_id
  end
end
