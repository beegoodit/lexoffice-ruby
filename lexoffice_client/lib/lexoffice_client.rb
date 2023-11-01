require "httparty"
require "rao-service"

require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.setup

module LexofficeClient
  def self.root
    Pathname.new(::File.expand_path("../..", __FILE__))
  end

  def self.configure
    yield Configuration
  end
end
