require "lexoffice_client"
require "spec_helper"

RSpec.describe LexofficeClient::Configuration do
  describe "api_token" do
    it "returns the api_token" do
      expect(described_class.api_token).to eq(nil)
    end
  end

  describe "api_base_url" do
    it "returns the api_base_url" do
      expect(described_class.api_base_url).to eq("https://api.lexoffice.io/v1")
    end
  end
end
