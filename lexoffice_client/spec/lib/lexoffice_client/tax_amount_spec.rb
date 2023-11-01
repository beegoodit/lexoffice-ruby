require "lexoffice_client"
require "spec_helper"

RSpec.describe LexofficeClient::TaxAmount do
  let(:tax_amount_json) { LexofficeClient.root.join(*%w[spec files lexoffice_client tax_amounts example.json]) }

  subject { described_class.new(JSON.parse(File.read(tax_amount_json))) }

  describe "tax_rate_percentage" do
    it { expect(subject.tax_rate_percentage).to eq(19.0) }
  end

  describe "tax_amount" do
    it { expect(subject.tax_amount).to eq(19.0) }
  end

  describe "net_amount" do
    it { expect(subject.tax_amount).to eq(19.0) }
  end
end
