require 'net/http'
require 'rubygems'
require 'open-uri'

module WonderWho
  class Request
    HOST = "https://rubygems.org"
    PATH = "/api/v1/search"
    attr_reader :keyword, :page

    def initialize(keyword:, page:)
      @keyword = keyword
      @page = page
    end

    def do
      uri = URI.parse("#{HOST}#{PATH}")
      uri.query = URI.encode_www_form({ query: keyword, page: page })

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      req = Net::HTTP::Get.new(uri.request_uri)
      res = http.request req

      respond(res: res)
    end

    private
    
    def conn
      @conn ||= Net::HTTP.new(uri.host, uri.port)
    end

    def respond(res:)
      require 'json'
      JSON.parse(res.body)
    end
  end
end
