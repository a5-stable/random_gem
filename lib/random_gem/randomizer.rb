require "random_gem/request"
require 'timeout'

module RandomGem
  class Randomizer
    class Error < Exception; end
    TIMEOUT = 30.seconds.freeze
    PAGE = 100.freeze

    def perform
      gems = Timeout.timeout(TIMEOUT, RandomGem::Randomizer::Error) { random_pick_loop }
      pick_single_gem(gems: gems)
    end

    private

    def random_pick_loop
      loop do
        request = RandomGem::Request.new(keyword: random_letter, page: random_index(max: PAGE))
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
