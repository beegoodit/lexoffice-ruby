require "rails_helper"

RSpec.describe "ActiveRecord::Base models", type: :model do
  # rubocop:disable Lint/ConstantDefinitionInBlock
  DEFAULT_SPECS_TO_RUN = [
    :is_a_lexoffice_client_model,
    :is_instanciable,
    :can_be_built_with_a_factory
  ]
  # rubocop:enable Lint/ConstantDefinitionInBlock

  {
    LexofficeClient::Address => {},
    LexofficeClient::Company => {},
    LexofficeClient::Contact => {}
  }.each do |model, options|
    options.reverse_merge!(specs_to_run: DEFAULT_SPECS_TO_RUN, specs_to_skip: [])
    specs_to_run = options.delete(:specs_to_run)
    specs_to_skip = options.delete(:specs_to_skip)
    specs = specs_to_run - specs_to_skip

    describe model do
      if specs.include?(:is_a_lexoffice_client_model)
        it "is a LexofficeClient::Model::Base" do
          expect(LexofficeClient::Model::Base.descendants).to include(model)
        end
      end

      if specs.include?(:is_instanciable)
        it "is instanciable" do
          instance = model.new
          expect(instance).to be_a(model)
        end
      end

      if specs.include?(:can_be_built_with_a_factory)
        it "is valid with correct attribute values" do
          instance = build(model.to_s.tableize.singularize.underscore.tr("/", "_"))

          expect(instance).to be_a(model)
        end
      end
    end
  end
end
