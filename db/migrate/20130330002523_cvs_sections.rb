class CvsSections < ActiveRecord::Migration
  def change
    create_table :cvs_sections do |t|
      t.references :cv
      t.references :section
      t.timestamps
    end
    add_index :cvs_sections, [:cv_id, :section_id], :unique => true
  end
end
