require_relative 'lib/random_gem/version'

Gem::Specification.new do |spec|
  spec.name          = "random_gem"
  spec.version       = RandomGem::VERSION
  spec.authors       = ["a5-stable"]
  spec.email         = ["sh07e1916@gmail.com"]

  spec.summary       = "pick up a random gem from rubygems"
  spec.description   = "RandomGem is a Ruby gem that selects a random gem from RubyGems and returns its name. Also, it provides a command to add a random gem to your Gemfile."
  spec.homepage      = "https://github.com/a5-stable/random_gem"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/a5-stable/random_gem"
  spec.metadata["changelog_uri"] = "https://github.com/a5-stable/random_gem"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"
end
