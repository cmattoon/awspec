# frozen_string_literal: true

module Awspec::Helper
  module Finder
    module ImagebuilderPipeline
      def find_imagebuilder_pipeline(id)
        selected = []
        req = {}
        loop do
          res = imagebuilder_client.list_image_pipelines(req)
          selected += res.image_pipeline_list.select do |pipeline|
            pipeline.arn == id || pipeline.name == id
          end
          break if res.next_token.nil?

          req[:next_token] = res.next_token
        end

        pipeline = selected.single_resource(id)
        return nil unless pipeline

        imagebuilder_client.get_image_pipeline(
          image_pipeline_arn: pipeline.arn
        ).image_pipeline
      rescue Aws::Imagebuilder::Errors::ResourceNotFoundException
        nil
      end
    end
  end
end
