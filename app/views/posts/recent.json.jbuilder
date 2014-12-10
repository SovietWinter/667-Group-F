json.array!(@followed_recent_posts) do |post|
  json.extract! post, :id, :user_id, :title, :content, :created_at, :num_recommends, :topic, :tags, :author_name, :bookmarkings, :author_pic
  json.url post_url(post, format: :json)
end
