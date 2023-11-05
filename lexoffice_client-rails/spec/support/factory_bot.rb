require "factory_bot"

FactoryBot.tap do |f|
  f.definition_file_paths = [
    LexofficeClient.root.join(*%w[spec factories])
  ]
  f.find_definitions
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
