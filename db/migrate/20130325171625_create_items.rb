class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.references :section
      t.string :type

      t.timestamps
    end
    add_index :items, :section_id
  end
end
