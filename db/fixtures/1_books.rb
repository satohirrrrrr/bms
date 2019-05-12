# frozen_string_literal: true

require 'csv'

CSV.foreach('db/fixtures/books.csv') do |row|
  puts row
  Book.create(name: row[0],
              isbn_10: row[1],
              isbn_13: row[2],
              asin: row[3],
              publicated_on: row[4],
              publisher: row[5],
              page_size: row[6],
              storage_location: row[7],
              amazon_url: row[8],
              image_url: row[9],
              image_data: row[10])
end