# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'feature_flag/version'

Gem::Specification.new do |gem|
  gem.name          = "feature_flag"
  gem.version       = FeatureFlag::VERSION
  gem.authors       = ["Trevor Oke"]
  gem.email         = ["trevor@trevoroke.com"]
  gem.description   = %q{Feature toggle for ruby/rails}
  gem.summary       = %q{Feature toggle for ruby/rails}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
