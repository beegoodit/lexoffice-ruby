require "lexoffice_client"
require "spec_helper"

RSpec.describe LexofficeClient::Contact::ReadService, type: :service, vcr: true do
  before(:each) do
    expect(LexofficeClient::Configuration).to receive(:api_base_url).and_return("https://api.lexoffice.io/v1")
  end

  describe "basic usage" do
    before(:each) do
      expect(LexofficeClient::Configuration).to receive(:api_token).and_return("n2.o0c.raladGqUDySbv9ZKZaNKME0pf7W3YulfNjlaTV1TC")
    end

    describe "result" do
      let(:contact_id) { "f46f7930-53df-48b0-b2cc-39a9f7ad6c7f" }
      let(:attributes) {
        {
          contact_id: contact_id
        }
      }
      let(:options) { {} }

      subject { described_class.call(attributes, options) }

      it { expect(subject).to be_a(Rao::Service::Result::Base) }
      it { expect(subject).to be_ok }

      describe "contact" do
        subject { described_class.call(attributes, options).contact }

        it { expect(subject).to be_a(LexofficeClient::Contact) }
      end
    end
  end

  describe "when not authorized" do
    before(:each) do
      expect(LexofficeClient::Configuration).to receive(:api_token).and_return("invalid-token")
    end

    describe "result" do
      let(:contact_id) { "59a3008f-9d96-4629-92ed-74fdbb2a4767" }
      let(:attributes) {
        {
          contact_id: contact_id
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
