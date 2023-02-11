require "wonder_who/request"
require 'timeout'

module WonderWho
  class Randomizer
    class Error < Exception; end

    def perform
      gems = Timeout.timeout(30, WonderWho::Randomizer::Error) { random_pick_loop }
      pick_single_gem(gems: gems)
    end

    private

    def random_pick_loop
      loop do
        request = WonderWho::Request.new(keyword: random_letter, page: random_index(max: 100))
        gems = request.do

        break gems if gems.length > 0
      end
    end

    def pick_single_gem_name(gems:)
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
