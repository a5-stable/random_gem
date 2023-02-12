require 'thor'
require 'random_gem'

module RandomGem
  class CLI < Thor
    include Thor::Actions
    desc "add", "add a gem to your Gemfile randomly"

    def add
      gem = RandomGem.pick
      gem_name = gem["name"]

      File.open("Gemfile", "a") do |file|
        file.puts("gem '#{gem_name}'")
      end

      puts "Yes! Gem '#{gem_name}' has been added to your Gemfile. For more information, see #{gem["documentation_uri"]}."
    end
  end
end

