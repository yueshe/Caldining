json.array!(@halls) do |hall|
  json.extract! hall, :id, :name
  json.url hall_url(hall, format: :json)
end
