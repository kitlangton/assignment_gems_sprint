# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rock_paper_scissors_icbm/version'

Gem::Specification.new do |spec|
  spec.name          = "rock_paper_scissors_icbm"
  spec.version       = RockPaperScissorsIcbm::VERSION
  spec.authors       = ["Kit Langton"]
  spec.email         = ["kitlangton@gmail.com"]

  spec.summary       = %q{A simple Rock, Paper, Scissors CLI — with global consequences.}
  spec.description   = %q{A simple Rock, Paper, Scissors CLI — with global consequences.}
  spec.homepage      = "https://github.com/kitlangton/assignment_gems_sprint"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"

  spec.add_dependency 'highline'
  spec.add_dependency 'rainbow'
end
