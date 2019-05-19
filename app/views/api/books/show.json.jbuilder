json.set! :book do
  json.extract! @book, :id, :name, :isbn_10, :isbn_13, :asin, :publicated_on, :publisher, :page_size, :storage_location, :control_number, :amazon_url, :image_url, :image_data
end
