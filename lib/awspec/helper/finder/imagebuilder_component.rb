# frozen_string_literal: true

module Awspec::Helper
  module Finder
    module ImagebuilderComponent
      def find_imagebuilder_component(id)
        selected = []
        req = {}
        loop do
          res = imagebuilder_client.list_components(req)
          selected += res.component_summary_list.select do |component|
            component.arn == id || component.name == id
          end
          break if res.next_token.nil?

          req[:next_token] = res.next_token
        end

        component = selected.single_resource(id)
        return nil unless component

        imagebuilder_client.get_component(
          component_arn: component.arn
        ).component
      rescue Aws::Imagebuilder::Errors::ResourceNotFoundException
        nil
      end
    end
  end
end
