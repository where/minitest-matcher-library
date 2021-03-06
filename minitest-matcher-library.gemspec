$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'minitest-matcher-library/version'

Gem::Specification.new do |s|
  s.name = "minitest-matcher-library"
  s.version = MinitestMatcherLibrary::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["ken mazaika"]
  s.date = "2013-03-29"
  s.description = "Add a library of useful matchers that work with zenspider/minitest-matchers"
  s.summary     = "Add a library of useful matchers that work with zenspider/minitest-matchers.  Should be used with minitest / minitest-matchers / valid_attribute"
  s.email = "kenmazaika@gmail.com"
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    "Gemfile",
    "README.md",
    "Rakefile",
    "lib/minitest-matcher-library.rb",
    "lib/minitest-matcher-library/test_helpers.rb",
    "lib/minitest-matcher-library/date_validation_matcher.rb",
    "lib/minitest-matcher-library/relationship_matcher.rb",
    "lib/minitest-matcher-library/version.rb",
    "minitest-matcher-library.gemspec",
  ]
  s.homepage = "http://github.com/where/minitest-matcher-library"
  s.require_paths = ["lib"]

end

