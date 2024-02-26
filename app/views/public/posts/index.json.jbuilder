json.data do
    json.items do
        json.array!(@posts) do |post|
            json.id post.id
            json.user do
                json.name post.user.name
                json.image url_for(post.user.get_profile_image(30,30))
            end
            json.image url_for(post.image)
            json.posted_title post.posted_title
            json.post_content post.post_content
            json.address post.address
            json.latitude post.latitude
            json.longitude post.longitude
        end
    end
end