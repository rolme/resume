class AddColumnToSections < ActiveRecord::Migration
  def change
    add_column :sections, :position, :integer
  end
end
