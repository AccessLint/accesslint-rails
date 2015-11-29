$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "access_lint_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "access_lint_rails"
  s.version     = AccessLintRails::VERSION
  s.authors     = ["Cameron Cundiff"]
  s.email       = ["github@ckundo.com"]
  s.homepage    = "http://www.accesslint.com"
  s.summary     = "AccessLint for Rails applications"
  s.description = "Web accessibility testing for Rails with AccessLint"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2"
end
