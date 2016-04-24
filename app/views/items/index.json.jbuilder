json.array!(@items) do |item|
  json.extract! item, :id, :name, :calories, :fat, :carb, :cholesterol, :protein, :sodium, :location, :date
  json.url item_url(item, format: :json)
end
