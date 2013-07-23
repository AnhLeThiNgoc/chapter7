json.array!(@micro_posts) do |micro_post|
  json.extract! micro_post, :content
  json.url micro_post_url(micro_post, format: :json)
end