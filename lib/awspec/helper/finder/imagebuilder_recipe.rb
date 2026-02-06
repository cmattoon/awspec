# frozen_string_literal: true

module Awspec::Helper
  module Finder
    module ImagebuilderRecipe
      def find_imagebuilder_recipe(id)
        return find_imagebuilder_recipe_by_arn(id) if id.start_with?('arn:')

        name, op, version = parse_imagebuilder_version_selector(id)
        selected = []
        req = {}
        loop do
          res = imagebuilder_client.list_image_recipes(req)
          selected += res.image_recipe_summary_list.select do |recipe|
            recipe.arn == id || recipe.name == name
          end
          break if res.next_token.nil?

          req[:next_token] = res.next_token
        end

        recipe = select_imagebuilder_version(selected, name, op, version)
        return nil unless recipe

        find_imagebuilder_recipe_by_arn(recipe.arn)
      rescue Aws::Imagebuilder::Errors::ResourceNotFoundException
        nil
      end

      private

      def find_imagebuilder_recipe_by_arn(arn)
        imagebuilder_client.get_image_recipe(
          image_recipe_arn: arn
        ).image_recipe
      end

      def parse_imagebuilder_version_selector(id)
        match = id.match(/\s+(@|>=|<=|>|<)\s+v?([0-9A-Za-z.\-_]+)\s*\z/)
        return [id, nil, nil] unless match

        name = id[0...match.begin(0)].strip
        [name, match[1], match[2]]
      end

      def select_imagebuilder_version(selected, name, op, version)
        return selected.single_resource(name) if op.nil?

        target = Gem::Version.new(version)
        matches = selected.select do |resource|
          resource_version = Gem::Version.new(resource.version)
          case op
          when '@'
            resource_version == target
          when '>'
            resource_version > target
          when '>='
            resource_version >= target
          when '<'
            resource_version < target
          when '<='
            resource_version <= target
          else
            false
          end
        end
        return nil if matches.empty?

        matches.max_by { |resource| Gem::Version.new(resource.version) }
      end
    end
  end
end
