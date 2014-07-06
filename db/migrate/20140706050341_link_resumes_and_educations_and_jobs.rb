class LinkResumesAndEducationsAndJobs < ActiveRecord::Migration
  def change
    create_table :educations_resumes, id: false do |t|
      t.belongs_to :education
      t.belongs_to :resume
    end

    create_table :jobs_resumes, id: false do |t|
      t.belongs_to :job
      t.belongs_to :resume
    end
  end
end
