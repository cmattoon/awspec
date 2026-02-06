# frozen_string_literal: true

module Awspec::Type
  class ImagebuilderRecipe < ResourceBase
    def resource_via_client
      @resource_via_client ||= find_imagebuilder_recipe(@display_name)
    end

    def id
      @id ||= resource_via_client.arn if resource_via_client
    end
  end
end
