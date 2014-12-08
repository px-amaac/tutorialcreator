json.array!(@tutorials) do |tutorial|
  json.extract! tutorial, :id, :title, :author, :description, :user_id
  json.url tutorial_url(tutorial, format: :json)
end
