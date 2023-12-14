module LexofficeClient
  class File::ReadService < Rao::Service::Base
    class Result < Rao::Service::Result::Base
      attr_accessor :file_io, :request_response
    end

    attr_accessor :file_id

    validates :file_id, presence: true

    private

    def _perform
      @result.file_io = get_file_io!
    end

    def get_file_io!
      say "Getting file with id #{file_id} from lexoffice" do
        response = HTTParty.get("#{instance_exec(&LexofficeClient::Configuration.api_base_url)}/files/#{file_id}", headers: request_headers)

        @result.request_response = response

        if response.code != 200
          add_error_and_say(:request, "HTTP Error: #{response.code}")
          return
        end

        @result.file_io = build_document(response)
      end
    end

    def request_headers
      @request_headers ||= {
        "Accept" => "*/*",
        "Authorization" => "Bearer #{instance_exec(&LexofficeClient::Configuration.api_token)}"
      }
    end

    def build_document(response)
      LexofficeClient::Document.new(
        blob: response.body,
        content_type: response.content_type,
        original_filename: response.headers["content-disposition"].match(/^.*=(.*);$/)[1]
      )
    end
  end
end
