require "lexoffice_client"
require "spec_helper"

RSpec.describe LexofficeClient::LineItem do
  let(:invoice_json) { LexofficeClient.root.join(*%w[spec files lexoffice_client line_items example.json]) }

  subject { described_class.new(JSON.parse(File.read(invoice_json))) }

  describe "unit_price" do
    it { expect(subject.unit_price).to be_a(LexofficeClient::UnitPrice) }
  end
end
