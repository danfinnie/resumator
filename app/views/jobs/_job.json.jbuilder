json.extract! job, :id, :started, :ended, :title, :place, :created_at, :updated_at
json.url job_url(job, format: :json)
json.description do
  json.markdown job.description
  json.html GitHub::Markdown.render_gfm(job.description)
end
