LexofficeClient.configure do |config|
  # Set the API token to use for authentication with the lexoffice API.
  #
  # Default: ENV.fetch("LEXOFFICE_CLIENT_API_TOKEN", nil)
  #
  config.api_token = ENV.fetch("LEXOFFICE_CLIENT_API_TOKEN", nil)

  # Set the API base URL to use for the lexoffice API.
  #
  # Default: ENV.fetch("LEXOFFICE_CLIENT_API_BASE_URL", "https://api.lexoffice.io/v1")
  #
  config.api_base_url = ENV.fetch("LEXOFFICE_CLIENT_API_BASE_URL", "https://api.lexoffice.io/v1")
end
