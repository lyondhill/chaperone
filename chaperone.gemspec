# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chaperone/version'

Gem::Specification.new do |gem|
  gem.name          = "chaperone"
  gem.version       = Chaperone::VERSION
  gem.authors       = ["lyon"]
  gem.email         = ["lyondhill@gmail.com"]
  gem.description   = %q{Guides your little application to building successful rest client data}
  gem.summary       = %q{restful app generation made easy}
  gem.homepage      = "http://github.com/lyondhill/chaperone"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
