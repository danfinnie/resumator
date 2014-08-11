json.extract! education, :id, :obtained_at, :title, :place, :location, :gpa, :created_at, :updated_at
json.url education_url(education, format: :json)
json.description do
  json.markdown education.description
  json.html Maruku.new(education.description).to_html
end
