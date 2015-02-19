json.array!(@projects) do |project|
  json.extract! project, :id, :projectName, :description, :site
  json.url project_url(project, format: :json)
end
