json.extract! job, :id, :started_at, :ended_at, :title, :place, :location, :created_at, :updated_at
json.url job_url(job, format: :json)
json.description do
  json.markdown job.description
  json.html Maruku.new(job.description).to_html
end
