class Resume < ActiveRecord::Base
  has_and_belongs_to_many :educations
  has_and_belongs_to_many :jobs, -> { order started: :desc }
end
