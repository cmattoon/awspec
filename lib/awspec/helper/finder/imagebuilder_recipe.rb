# frozen_string_literal: true

module Awspec::Helper
  module Finder
    module ImagebuilderRecipe
      def find_imagebuilder_recipe(id)
        selected = []
        req = {}
        loop do
          res = imagebuilder_client.list_image_recipes(req)
          selected += res.image_recipe_summary_list.select do |recipe|
            recipe.arn == id || recipe.name == id
          end
          break if res.next_token.nil?

          req[:next_token] = res.next_token
        end

        recipe = selected.single_resource(id)
        return nil unless recipe

        imagebuilder_client.get_image_recipe(
          image_recipe_arn: recipe.arn
        ).image_recipe
      rescue Aws::Imagebuilder::Errors::ResourceNotFoundException
        nil
      end
    end
  end
end
