
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "breweries_near_me/version"

Gem::Specification.new do |spec|
  spec.name          = "breweries_near_me"
  spec.version       = BreweriesNearMe::VERSION
  spec.authors       = ["'Nolan Hughes'"]
  spec.email         = ["'nhughes987@gmail.com'"]

  spec.summary       = %q{A gem to find breweries near you.}
  spec.homepage      = "https://learn.co"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "rest-client"
end
