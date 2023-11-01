module LexofficeClient
  class Configuration
    class << self
      extend Forwardable

      attr_accessor :values

      def define_option(key, default: nil)
        @values[key] = default
        define_singleton_method(key) do
          @values[key]
        end

        define_singleton_method("#{key}=") do |value|
          @values[key] = value
        end
      end
    end

    @values = {}

    define_option :api_token, default: ENV.fetch("LEXOFFICE_CLIENT_API_TOKEN", nil)
    define_option :api_base_url, default: ENV.fetch("LEXOFFICE_CLIENT_API_BASE_URL", "https://api.lexoffice.io/v1")
  end
end
