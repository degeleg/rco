json.array!(@image_assets) do |image|
json.title image.name
json.value image.image_url
end