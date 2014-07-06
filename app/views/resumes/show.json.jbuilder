json.extract! @resume, :name, :id
json.url resume_path(@resume)

json.jobs do
  json.partial! 'jobs/job', collection: @resume.jobs, as: :job
end

json.educations do
  json.partial! 'educations/education', collection: @resume.educations, as: :education
end
