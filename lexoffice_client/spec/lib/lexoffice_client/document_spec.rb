require "lexoffice_client"
require "spec_helper"

RSpec.describe LexofficeClient::Document do
  describe "to_string_io" do
    it { expect(subject.to_string_io).to be_a(StringIO) }
  end
end
