json.array!(@reviews) do |review|
  json.extract! review, 
  json.url review_url(review, format: :json)
end