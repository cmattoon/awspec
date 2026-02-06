# frozen_string_literal: true

module Awspec::Generator
  module Doc
    module Type
      class ImagebuilderRecipe < Base
        def initialize
          super
          @type_name = 'ImagebuilderRecipe'
          @type = Awspec::Type::ImagebuilderRecipe.new('my-imagebuilder-recipe')
          @ret = @type.resource_via_client
          @matchers = []
          @ignore_matchers = []
          @describes = []
        end
      end
    end
  end
end
