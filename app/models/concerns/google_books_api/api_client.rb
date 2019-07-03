# frozen_string_literal: true

require 'uri'

module GoogleBooksApi

  #
  # Google Book Api呼び出しモジュール
  #
  class ApiClient
  
    class << self
      def call(param)
        puts param
        escaped_param = URI.encode_www_form(q: param)
        puts escaped_param
        uri = Addressable::URI.parse("https://www.googleapis.com/books/v1/volumes?#{escaped_param}")
        response = Net::HTTP.get(uri)
        JSON.parse(response) rescue { "totalItems": 0 }
      end
    end
  end
end