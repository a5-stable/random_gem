require "random_gem/request"
require "random_gem/query"
require 'timeout'

module RandomGem
  class Randomizer
    class Error < Exception; end
    TIMEOUT = 10.freeze
    PAGE = 10.freeze

    def perform(download_options: {})
      gems = Timeout.timeout(TIMEOUT, RandomGem::Randomizer::Error) { random_pick_loop(download_options: download_options) }
      pick_single_gem(gems: gems)
    end

    private

    def random_pick_loop(download_options:)
      loop do
        query = Query.new(random_letter, download_options: download_options)
        page = random_index(max: PAGE)

        request = RandomGem::Request.new(query, page)
        gems = request.do

        break gems if gems.length > 0
      end
    end

    def pick_single_gem(gems:)
      index = random_index(max: gems.length)
      gems[index]
    end

    def random_letter
      ('a'..'z').to_a.sample
    end

    def random_index(max:)
      rand(max) - 1
    end
  end
end
