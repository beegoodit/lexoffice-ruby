require "lexoffice_client"
require "spec_helper"

RSpec.describe LexofficeClient::Contact do
  let(:contact_json) { LexofficeClient.root.join(*%w[spec files lexoffice_client contacts example.json]) }

  subject { described_class.new(JSON.parse(File.read(contact_json))) }

  describe "id" do
    it { expect(subject.id).to eq("17fa5473-67c2-4115-8946-fff5b8c59098") }
  end

  describe "organization_id" do
    it { expect(subject.organization_id).to eq("f943ae79-b32e-4c2a-91c2-bb46ed940f90") }
  end

  describe "version" do
    it { expect(subject.version).to eq(2) }
  end

  describe "roles" do
    it { expect(subject.roles.keys).to match_array(%w[customer]) }
  end

  describe "company" do
    it { expect(subject.company).to be_a(LexofficeClient::Company) }
  end

  describe "addresses" do
    it { expect(subject.addresses.keys).to match_array(%w[billing]) }
  end

  describe "archived" do
    it { expect(subject.archived).to eq(false) }
  end

  describe "email_addresses" do
    it { expect(subject.email_addresses).to eq(nil) }
  end
end
