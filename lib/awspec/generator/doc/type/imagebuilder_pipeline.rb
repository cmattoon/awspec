# frozen_string_literal: true

module Awspec::Generator
  module Doc
    module Type
      class ImagebuilderPipeline < Base
        def initialize
          super
          @type_name = 'ImagebuilderPipeline'
          @type = Awspec::Type::ImagebuilderPipeline.new('my-imagebuilder-pipeline')
          @ret = @type.resource_via_client
          @matchers = []
          @ignore_matchers = []
          @describes = []
        end
      end
    end
  end
end
