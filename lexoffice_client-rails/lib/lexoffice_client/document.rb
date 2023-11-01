module LexofficeClient
  class Document < LexofficeClient::Model::Base
    attr_accessor :original_filename, :content_type, :blob

    def to_string_io
      StringIO.new(blob || "").tap do |string_io|
        string_io.class.class_eval do
          attr_accessor :original_filename, :content_type
        end
        string_io.content_type = content_type
        string_io.original_filename = original_filename
      end
    end
  end
end
