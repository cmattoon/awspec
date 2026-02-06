# frozen_string_literal: true

module Awspec::Generator
  module Doc
    module Type
      class ImagebuilderComponent < Base
        def initialize
          super
          @type_name = 'ImagebuilderComponent'
          @type = Awspec::Type::ImagebuilderComponent.new('my-imagebuilder-component')
          @ret = @type.resource_via_client
          @matchers = []
          @ignore_matchers = []
          @describes = []
        end
      end
    end
  end
end
