# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google_play_reviews/version'

Gem::Specification.new do |spec|
  spec.name          = "google_play_reviews"
  spec.version       = GooglePlayReviews::VERSION
  spec.authors       = ["Weihu Chen"]
  spec.email         = ["cctiger36@gmail.com"]

  spec.summary       = %q{Fetch App reviews from Google Play.}
  spec.description   = %q{Fetch App reviews from Google Play.}
  spec.homepage      = "https://github.com/cctiger36/google_play_reviews"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
end
