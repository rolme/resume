class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :section
      t.string :header
      t.string :type

      t.timestamps
    end
    add_index :sections, :section_id
  end
end
