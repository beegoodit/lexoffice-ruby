require "lexoffice_client"
require "spec_helper"

RSpec.describe LexofficeClient::Invoice::CreateService, vcr: true do
  before(:each) do
    expect(LexofficeClient::Configuration).to receive(:api_base_url).and_return(-> { "https://api.lexoffice.io/v1" })
  end

  describe "basic usage" do
    before(:each) do
      expect(LexofficeClient::Configuration).to receive(:api_token).and_return(-> { "n2.o0c.raladGqUDySbv9ZKZaNKME0pf7W3YulfNjlaTV1TC" })
    end

    describe "result" do
      let(:invoice) { build(:lexoffice_client_invoice, :for_create) }
      let(:attributes) {
        {
          invoice: invoice
        }
      }
      let(:options) { {} }

      subject { described_class.call(attributes, options) }

      it { expect(subject).to be_a(Rao::Service::Result::Base) }
      it { expect(subject).to be_ok }

      describe "invoice_meta" do
        subject { described_class.call(attributes, options).invoice_meta }

        it { expect(subject).to be_a(Hash) }
        it { expect(subject.keys).to include("id", "resource_uri", "created_date", "updated_date", "version") }
        it { expect(subject["message"]).to be_nil }
        it { expect(subject["details"]).to be_nil }
      end
    end
  end

  describe "when not authorized" do
    before(:each) do
      expect(LexofficeClient::Configuration).to receive(:api_token).and_return(-> { "invalid-token" })
    end

    describe "result" do
      let(:invoice) { build(:lexoffice_client_invoice, :for_create) }
      let(:attributes) {
        {
          invoice: invoice
        }
      }
      let(:options) { {} }

      subject { described_class.call(attributes, options) }

      it { expect(subject).to be_a(Rao::Service::Result::Base) }
      it { expect(subject).to_not be_ok }
      it { expect(subject.errors[:request]).to include("HTTP Error: 401") }
    end
  end
end
