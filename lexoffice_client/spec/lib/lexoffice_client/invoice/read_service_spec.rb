require "lexoffice_client"
require "spec_helper"

RSpec.describe LexofficeClient::Invoice::ReadService, type: :service, vcr: true do
  before(:each) do
    expect(LexofficeClient::Configuration).to receive(:api_base_url).and_return("https://api.lexoffice.io/v1")
  end

  describe "basic usage" do
    before(:each) do
      expect(LexofficeClient::Configuration).to receive(:api_token).and_return("n2.o0c.raladGqUDySbv9ZKZaNKME0pf7W3YulfNjlaTV1TC")
    end

    describe "result" do
      let(:invoice_id) { "59a3008f-9d96-4629-92ed-74fdbb2a4767" }
      let(:attributes) {
        {
          invoice_id: invoice_id
        }
      }
      let(:options) { {} }

      subject { described_class.call(attributes, options) }

      it { expect(subject).to be_a(Rao::Service::Result::Base) }
      it { expect(subject).to be_ok }

      describe "invoice" do
        subject { described_class.call(attributes, options).invoice }

        it { expect(subject).to be_a(LexofficeClient::Invoice) }
      end
    end
  end

  describe "when not authorized" do
    before(:each) do
      expect(LexofficeClient::Configuration).to receive(:api_token).and_return("invalid-token")
    end

    describe "result" do
      let(:invoice_id) { "59a3008f-9d96-4629-92ed-74fdbb2a4767" }
      let(:attributes) {
        {
          invoice_id: invoice_id
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
