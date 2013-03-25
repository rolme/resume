class CreateContactTypes < ActiveRecord::Migration
  def change
    create_table :contact_types do |t|
      t.string :name, :limit => 64

      t.timestamps
    end
  end
end
