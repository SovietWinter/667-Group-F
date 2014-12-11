json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :title, :content, :created_at, :num_recommends, :topic, :author_name, :author_pic, :bookmarkings
  json.url post_url(post, format: :json)
end
