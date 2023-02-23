require "random_gem/request"
require 'timeout'

module RandomGem
  class Query
    attr_accessor :name, :min_download, :max_download

    def initialize(name, download_options: {})
      @name = name
      @min_download = download_options.dig(:min)
      @max_download = download_options.dig(:max)
    end

    def to_parameter_string
      str = "name: #{name}"
      str += "   downloads: >#{min_download}" if min_download
      str += "   downloads: <#{max_download}" if max_download

      str
    end
  end
end
