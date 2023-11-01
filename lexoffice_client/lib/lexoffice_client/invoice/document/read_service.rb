module LexofficeClient
  class Invoice::Document::ReadService < Rao::Service::Base
    class Result < Rao::Service::Result::Base
      attr_accessor :document, :document_file_id, :request_response
    end

    attr_accessor :invoice_id # Lexoffice UUID

    validates :invoice_id, presence: true

    private

    def _perform
      @result.document_file_id = get_document_file_id!
      @result.document = get_document!
    end

    def get_document_file_id!
      say "Getting document file id for invoice with id #{invoice_id}" do
        response = HTTParty.get("#{LexofficeClient::Configuration.api_base_url}/invoices/#{invoice_id}/document", headers: request_headers)

        @result.request_response = response

        if response.code != 200
          if response.code == 406
            add_error_and_say(:request, "HTTP Error: #{response.code} - #{parsed_response["message"]}")
          else
            add_error_and_say(:request, "HTTP Error: #{response.code}")
          end
          nil
        end

        parsed_response["document_file_id"]
      end
    end

    def request_headers
      @request_headers ||= {
        "Authorization" => "Bearer #{LexofficeClient::Configuration.api_token}"
      }
    end

    def parsed_response
      @parsed_response ||= JSON.parse(@result.request_response.body).deep_transform_keys(&:underscore)
    end

    def get_document!
      LexofficeClient::File::ReadService.call({file_id: @result.document_file_id}).file_io
    end
  end
end
