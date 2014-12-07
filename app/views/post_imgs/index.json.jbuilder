json.array!(@post_imgs) do |post_img|
  json.extract! post_img, :id, :post_id, :image
  json.url post_img_url(post_img, format: :json)
end
