
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pace/ruby/version"

Gem::Specification.new do |spec|
  spec.name          = "pace-ruby"
  spec.version       = Pace::Ruby::VERSION
  spec.authors       = ["Paingha Joe Alagoa"]
  spec.email         = ["apaingha@gmail.com"]

  spec.summary       = "This is a Ruby Client Library (Ruby Gem) to interact with the Go Pace Client API."
  spec.description   = "Go Pace is a delivery service that enables everyone to get what they want when they need it most. This is a Ruby Client Library (Ruby Gem) to interact with the Go Pace Client API."
  spec.homepage      = "https://github.com/paingha/pace-ruby"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "http://mygemserver.com"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/Go-Pace/pace-ruby"
    spec.metadata["changelog_uri"] = "https://github.com/paingha/pace-ruby/changelog.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.2.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency 'httparty'
end
