# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "hashrush"
  spec.date          = Date.today.to_s
  spec.version       = "2.0.1"
  spec.authors       = ["Epigene"]
  spec.email         = ["augusts.bautra@gmail.com"]

  spec.summary       = %q{Simplifies building hashes from pre-loaded variables}
  spec.homepage      = "https://github.com/Epigene/hashrush"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.5.0"
  spec.add_development_dependency "rspec-rails", "~> 3.4.0"
end
