class RenameColumnSectionIdToParentIdInTableSections < ActiveRecord::Migration
  def up
    rename_column :sections, :section_id, :parent_id
  end

  def down
    rename_column :sections, :parent_id, :section_id
  end
end
