class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.date :obtained_at
      t.string :title
      t.string :place
      t.string :gpa
      t.text :description

      t.timestamps
    end
  end
end
