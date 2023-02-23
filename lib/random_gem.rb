require "random_gem/cli"
require "random_gem/query"
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

  def self.pick_by_downloads(lower_limit: nil, upper_limit: nil)
    Randomizer.new.perform( download_options: { min: lower_limit, max: upper_limit }.compact )
  rescue Randomizer::Error
    raise Error.new
  end
end
