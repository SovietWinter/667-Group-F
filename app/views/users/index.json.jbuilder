json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :real_name, :prof_pic, :blog_name, :city, :country
  json.url user_url(user, format: :json)
end
