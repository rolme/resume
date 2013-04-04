class RemoveColumnFromCvsSections < ActiveRecord::Migration
  def up
    remove_column :cvs_sections, :created_at
    remove_column :cvs_sections, :updated_at
  end

  def down
    add_column :cvs_sections, :updated_at, :string
    add_column :cvs_sections, :created_at, :string
  end
end
