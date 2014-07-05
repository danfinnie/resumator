json.array!(@jobs) do |job|
  json.extract! job, :id, :started, :ended, :title, :place, :description
  json.url job_url(job, format: :json)
end
