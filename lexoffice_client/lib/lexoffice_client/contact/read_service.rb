module LexofficeClient
  class Contact::ReadService < Rao::Service::Base
    class Result < Rao::Service::Result::Base
      attr_accessor :contact, :request_response
    end

    attr_accessor :contact_id

    validates :contact_id, presence: true

    private

    def _perform
      @result.contact = get_contact!
    end

    def get_contact!
      response = HTTParty.get("#{instance_exec(&LexofficeClient::Configuration.api_base_url)}/contacts/#{contact_id}", headers: request_headers)

      @result.request_response = response

      if response.code != 200
        add_error_and_say(:request, "HTTP Error: #{response.code}")
        return
      end

      parsed_response = JSON.parse(response.body).deep_transform_keys(&:underscore)

      say "Contact found:" do
        contact = Contact.new(parsed_response)
        say "#{contact.as_json}"
        contact
      end
    end

    def request_headers
      @request_headers ||= {
        "Authorization" => "Bearer #{instance_exec(&LexofficeClient::Configuration.api_token)}"
      }
    end
  end
end
