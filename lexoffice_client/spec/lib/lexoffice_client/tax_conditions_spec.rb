require "lexoffice_client"
require "spec_helper"

RSpec.describe LexofficeClient::TaxConditions do
  let(:tax_conditions_json) { LexofficeClient.root.join(*%w[spec files lexoffice_client tax_conditions example.json]) }

  subject { described_class.new(JSON.parse(File.read(tax_conditions_json))) }

  describe "tax_type" do
    it { expect(subject.tax_type).to eq("net") }
  end
end
