require 'net/http'
require 'rubygems'
require 'open-uri'
require 'json'

module RandomGem
  class Request
    HOST = "https://rubygems.org"
    PATH = "/api/v1/search"
    attr_reader :keyword, :page

    def initialize(keyword:, page:)
      @keyword = keyword
      @page = page
    end

    def do
      uri = URI("#{HOST}#{PATH}")
      params = { query: keyword, page: page }
      uri.query = URI.encode_www_form(params)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      res = http.get(uri.request_uri)
      respond(res: res)
    end

    private

    def respond(res:)
      JSON.parse(res.body)
    end
  end
end
