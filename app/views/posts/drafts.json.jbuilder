json.array!(@posts) do |post|
  json.extract! post, :id, :title, :content, :created_at, :num_recommends, :topic
  json.url post_url(post, format: :json)
end
