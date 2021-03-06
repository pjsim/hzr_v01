json.array!(@products) do |product|
  json.extract! product, :name, :price, :description
  json.url product_url(product, format: :json)
end
