module LexofficeClient
  module Model
    class Base
      if Object.const_defined?(:Rails)
        extend ActiveModel::Translation
        extend ActiveModel::Naming
        include ActiveModel::Conversion
      end

      def initialize(attributes = {})
        attributes.each do |k, v|
          send("#{k.to_s.underscore}=", v)
        end
      end

      def attributes=(attributes)
        attributes.each do |k, v|
          send("#{k.to_s.underscore}=", v)
        end
      end

      module AttributeNamesConcern
        def self.included(base)
          base.extend(ClassMethods)
        end

        module ClassMethods
          def attr_accessor(*)
            super
            add_attribute_names(*)
          end

          def attr_reader(*)
            super
            add_attribute_names(*)
          end

          def add_attribute_names(*args)
            args.each do |attr_name|
              attribute_names << attr_name
            end
          end

          def attribute_names
            @attr_names ||= []
          end

          # alias attributes_names to column_names for ActiveModel compatibility
          alias_method :column_names, :attribute_names
        end

        def attributes
          self.class.attribute_names.each_with_object({}) do |attr_name, memo|
            memo[attr_name.to_sym] = send(attr_name)
          end
        end
      end

      include AttributeNamesConcern

      module SerializationConcern
        def as_json(options = {})
          attributes.each_with_object({}) do |(attr_name, value), memo|
            memo[attr_name.to_sym] = value.respond_to?(:as_json) ? value.as_json(options) : value
          end
        end

        def to_json(options = {})
          as_json(options).to_json
        end
      end

      include SerializationConcern
    end
  end
end
