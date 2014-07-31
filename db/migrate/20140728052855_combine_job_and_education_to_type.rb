class CombineJobAndEducationToType < ActiveRecord::Migration
  def up
    create_table :experiences do |t|
      t.date :ended_at
      t.date :obtained_at
      t.date :started_at
      t.string :gpa
      t.string :location
      t.string :place
      t.string :title
      t.string :type
      t.text :description

      t.timestamps
    end

    create_table :experiences_resumes do |t|
      t.belongs_to :experience
      t.belongs_to :resume
    end

    drop_table :jobs
    drop_table :educations
    drop_table :jobs_resumes
    drop_table :educations_resumes
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
