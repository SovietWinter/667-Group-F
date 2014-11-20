json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :title, :content, :created_at, :num_recommends, :topic
  json.url post_url(post, format: :json)
end
