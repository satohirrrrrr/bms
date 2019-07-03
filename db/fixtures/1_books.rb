# frozen_string_literal: true

require 'csv'

CSV.foreach('db/fixtures/books.csv') do |row|
  puts row
  Book.create(name: row[0],
              isbn_10: row[1],
              isbn_13: row[2],
              publicated_on: row[4],
              publisher: row[5],
              page_size: row[6],
              storage_location: row[7],
              image_url: row[8])
end