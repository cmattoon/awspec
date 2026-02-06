# frozen_string_literal: true

module Awspec::Type
  class ImagebuilderPipeline < ResourceBase
    def resource_via_client
      @resource_via_client ||= find_imagebuilder_pipeline(@display_name)
    end

    def id
      @id ||= resource_via_client.arn if resource_via_client
    end
  end
end
