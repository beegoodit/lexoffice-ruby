$LOAD_PATH.push File.expand_path("../lib", __FILE__)

require_relative "lib/lexoffice_client/version"

Gem::Specification.new do |spec|
  spec.name = "lexoffice_client"
  spec.version = LexofficeClient::VERSION
  spec.authors = ["BeeGood IT"]
  spec.email = ["info@beegoodit.de"]
  spec.homepage = "https://hosting.beegoodit.de"
  spec.summary = "Lexoffice API Client"
  spec.description = "Provides a client for the Lexoffice API."

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{lib,spec/factories}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.required_ruby_version = '>= 3.4.5'

  spec.add_dependency "httparty"
  spec.add_dependency "rao-service"
  spec.add_dependency "zeitwerk"
end
