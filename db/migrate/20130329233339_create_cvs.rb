class CreateCvs < ActiveRecord::Migration
  def change
    create_table :cvs do |t|
      t.references :user
      t.string :title
      t.string :target

      t.timestamps
    end
    add_index :cvs, :user_id
  end
end
