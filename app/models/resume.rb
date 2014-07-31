class Resume < ActiveRecord::Base
  has_and_belongs_to_many :experiences

  has_and_belongs_to_many :jobs,
    -> { order started_at: :desc },
    association_foreign_key: 'experience_id',
    join_table: 'experiences_resumes'

  has_and_belongs_to_many :educations,
    -> { order started_at: :desc },
    association_foreign_key: 'experience_id',
    join_table: 'experiences_resumes'
end
