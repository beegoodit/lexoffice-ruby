$LOAD_PATH.push File.expand_path("../lib", __FILE__)

require_relative "lib/lexoffice_client/rails/version"

Gem::Specification.new do |spec|
  spec.name = "lexoffice_client-rails"
  spec.version = LexofficeClient::Rails::VERSION
  spec.authors = ["BeeGood IT"]
  spec.email = ["info@beegoodit.de"]
  spec.homepage = "https://hosting.beegoodit.de"
  spec.summary = "Lexoffice API Client Rails Integration"
  spec.description = "Provides the integration of the Lexoffice API Client into Rails."

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{lib,spec/factories}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.required_ruby_version = ">= 3.4.5"

  spec.add_dependency "rails", ">= 8.0"
  spec.add_dependency "lexoffice_client"
end
