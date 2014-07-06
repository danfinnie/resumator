json.extract! education, :id, :obtained_at, :title, :place, :gpa, :created_at, :updated_at
json.url education_url(education, format: :json)
json.description do
  json.markdown education.description
  json.html GitHub::Markdown.render_gfm(education.description)
end
