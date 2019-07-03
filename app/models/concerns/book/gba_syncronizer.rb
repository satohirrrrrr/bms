# frozen_string_literal: true

class Book < ApplicationRecord
  #
  # 書籍情報をGoogle Book Apiと同期するモジュール
  #
  class GbaSyncronizer
    
    def self.execute(books)
      syncronizer = GbaSyncronizer.new
      i = 0
      books.each do |book|
        # リクエストを作成してGBAを呼び出す
        json = GoogleBooksApi::ApiClient.call(syncronizer.create_params(book))
        # 取得したレスポンスで更新する
        syncronizer.update_book(book, json)
        i = i + 1
        break if i > 15
      end
      books
    end
    
    def create_params(book)
      isbn = book.isbn_13 ? book.isbn_13.gsub('-', '') : book.isbn_10
      param = []
      param << "intitle:#{book.name}" if book.name.present?
      # param << "inpublisher:#{book.publisher}" if book.publisher.present?
      param << "isbn:#{isbn}" if isbn.present?
      param.join('+')
    end

    def update_book(book, json)
      ActiveRecord::Base.transaction do
        return if json["totalItems"] == 0
        puts "totalItems is more than 0"
        info = json["items"][0]["volumeInfo"]
        book.subtitle = info["subtitle"]
        book.description = info["description"]
        book.isbn_10 = info["industryIdentifiers"][0]["identifier"]
        book.isbn_13 = info["industryIdentifiers"][1]["identifier"]
        book.publicated_on = info["publishedDate"]
        book.page_size = info["pageCount"]
        book.image_url = info["imageLinks"]["thumbnail"] if info["imageLinks"].present?
        book.is_sync_gba = true
        book.save!
      end
    end
  end
end