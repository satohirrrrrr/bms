json.set! :books do
  json.array! @books do |book|
    json.extract! book, :id, :name, :subtitle, :description, :image_url, :is_sync_gba
  end
end