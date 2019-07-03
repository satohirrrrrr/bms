json.set! :book do
  json.extract! @book, :id, :name, :subtitle, :isbn_10, :isbn_13, :publicated_on, :publisher, :page_size, :storage_location, :control_number, :image_url
end
