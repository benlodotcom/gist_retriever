# -*- encoding: utf-8 -*-
require File.expand_path('../lib/gist_retriever/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Benjamin Loulier"]
  gem.email         = ["benjamin.loulier@gfi.fr"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "gist_retriever"
  gem.require_paths = ["lib"]
  gem.version       = GistRetriever::VERSION

  gem.add_development_dependency "rspec"
end
