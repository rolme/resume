class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :handle
      t.string :first_name
      t.string :last_name
      t.string :encrypted_password
      t.string :type

      t.timestamps
    end
  end
end
