require "lexoffice_client"
require "spec_helper"

RSpec.describe "Lexoffice::Model::Base models", type: :model do
  # rubocop:disable Lint/ConstantDefinitionInBlock
  DEFAULT_SPECS_TO_RUN = [
    :is_an_active_record,
    :is_instanciable,
    :has_a_valid_factory
    # :valid_with_correct_attributes,
    # :not_valid_with_empty_attributes,
    # :saves_with_valid_attributes
  ]
  # rubocop:enable Lint/ConstantDefinitionInBlock

  {
    LexofficeClient::Address => {},
    LexofficeClient::Contact => {},
    LexofficeClient::Company => {},
    LexofficeClient::Document => {},
    LexofficeClient::Invoice => {},
    LexofficeClient::LineItem => {},
    LexofficeClient::PaymentConditions => {factory_name: ->(model) { model.to_s.tableize.underscore.tr("/", "_") }},
    LexofficeClient::RelatedVoucher => {},
    LexofficeClient::ShippingConditions => {factory_name: ->(model) { model.to_s.tableize.underscore.tr("/", "_") }},
    LexofficeClient::TaxAmount => {},
    LexofficeClient::TaxConditions => {factory_name: ->(model) { model.to_s.tableize.underscore.tr("/", "_") }},
    LexofficeClient::TotalPrice => {},
    LexofficeClient::UnitPrice => {}
  }.each do |model, options|
    options.reverse_merge!(specs_to_run: DEFAULT_SPECS_TO_RUN, specs_to_skip: [], factory_name: ->(model) { model.to_s.tableize.singularize.underscore.tr("/", "_") })
    specs_to_run = options.delete(:specs_to_run)
    specs_to_skip = options.delete(:specs_to_skip)
    specs = specs_to_run - specs_to_skip
    factory_name = options.delete(:factory_name)

    describe model do
      if specs.include?(:is_an_active_record)
        it "is an LexofficeClient::Model::Base" do
          expect(model.ancestors).to include(model)
        end
      end

      if specs.include?(:is_instanciable)
        it "is instanciable" do
          instance = model.new
          expect(instance).to be_a(model)
        end
      end

      if specs.include?(:has_a_valid_factory)
        it "has a valid factory" do
          instance = build(factory_name.call(model))
          expect(instance).to be_a(model)
        end
      end

      if specs.include?(:valid_with_correct_attributes)
        it "is valid with correct attribute values" do
          instance = build(factory_name.call(model))

          instance.valid?
          expect(instance.errors.full_messages).to eq([])
        end
      end

      if specs.include?(:not_valid_with_empty_attributes)
        it "is not valid with empty attributes" do
          instance = model.new
          expect(instance).not_to be_valid
        end
      end

      if specs.include?(:saves_with_valid_attributes)
        it "saves with valid attributes" do
          instance = build(factory_name.call(model))
          expect(instance.save).to be_truthy
          expect(instance).to be_persisted
        end
      end
    end
  end
end
