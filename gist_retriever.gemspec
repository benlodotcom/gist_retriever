# -*- encoding: utf-8 -*-
require File.expand_path('../lib/gist_retriever/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Benjamin Loulier"]
  gem.email         = ["benlodotcom@gmail.com"]
  gem.description   = %q{gist_retreiver detects gist markup in a string, retrieves the gist content and replaces
                        the markup using the gist plaintext content (see examples of use) .}
  gem.summary       = %q{TODO: write summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "gist_retriever"
  gem.require_paths = ["lib"]
  gem.version       = GistRetriever::VERSION
  
end
