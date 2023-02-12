require "random_gem/randomizer"
require "random_gem/version"

module RandomGem
  class Error < StandardError
    def initialize(msg: nil)
      msg ||= "An unexpected error occured. Please try again later."
      super(msg)
    end
  end

  def self.pick
    Randomizer.new.perform
  rescue Randomizer::Error
    raise Error.new
  end
end
