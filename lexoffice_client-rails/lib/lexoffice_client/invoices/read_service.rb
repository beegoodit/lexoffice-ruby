module LexofficeClient
  module Invoices
    class ReadService < Rao::Service::Base
      class Result < Rao::Service::Result::Base
        attr_accessor :invoice, :request_response
      end

      attr_accessor :invoice_id

      validates :invoice_id, presence: true

      private

      def _perform
        @result.invoice = get_invoice!
      end

      def get_invoice!
        response = HTTParty.get("#{LexofficeClient::Configuration.api_base_url}/invoices/#{invoice_id}", headers: request_headers)

        @result.request_response = response

        if response.code != 200
          add_error_and_say(:request, "HTTP Error: #{response.code}")
          return
        end

        parsed_response = JSON.parse(response.body).deep_transform_keys(&:underscore)

        Invoice.new(parsed_response)
      end

      def request_headers
        @request_headers ||= {
          "Authorization" => "Bearer #{LexofficeClient::Configuration.api_token}"
        }
      end
    end
  end
end
