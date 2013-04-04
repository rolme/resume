class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.date :start_date
      t.date :end_date
      t.string :title
      t.string :department
      t.string :company
      t.integer :experienceable_id
      t.string :experienceable_type

      t.timestamps
    end
  end
end
