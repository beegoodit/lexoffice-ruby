module LexofficeClient
  class Invoice::CreateService < Rao::Service::Base
    class Result < Rao::Service::Result::Base
      attr_accessor :invoice_meta, :request_response
    end

    attr_accessor :invoice

    validates :invoice, presence: true

    private

    def _perform
      @result.invoice_meta = post_invoice!
    end

    def post_invoice!
      response = HTTParty.post("#{LexofficeClient::Configuration.api_base_url}/invoices", headers: request_headers, body: request_body)

      @result.request_response = response

      if response.code != 201
        add_error_and_say(:request, "HTTP Error: #{response.code}")
        return
      end

      JSON.parse(response.body).deep_transform_keys(&:underscore)
    end

    def request_headers
      @request_headers ||= {
        "Accept" => "application/json",
        "Content-Type" => "application/json",
        "Authorization" => "Bearer #{LexofficeClient::Configuration.api_token}"
      }
    end

    def request_body
      invoice.as_json.deep_transform_keys { |k| k.to_s.camelize(:lower) }.to_json
    end
  end
end
