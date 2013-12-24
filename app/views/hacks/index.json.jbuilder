json.array!(@hacks) do |hack|
  json.extract! hack, :description, :photo
  json.url hack_url(hack, format: :json)
end
