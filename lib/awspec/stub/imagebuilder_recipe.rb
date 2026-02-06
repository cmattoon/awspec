# frozen_string_literal: true

Aws.config[:imagebuilder] = {
  stub_responses: {
    list_image_recipes: {
      image_recipe_summary_list: [
        {
          arn: 'arn:aws:imagebuilder:us-east-1:123456789012:image-recipe/my-imagebuilder-recipe/1.0.0',
          name: 'my-imagebuilder-recipe',
          version: '1.0.0',
          platform: 'Linux',
          owner: 'Self',
          parent_image: 'arn:aws:imagebuilder:us-east-1:123456789012:image/my-parent-image/1.0.0',
          date_created: Time.parse('2018-10-28 00:23:32 -0400')
        }
      ]
    },
    get_image_recipe: {
      image_recipe: {
        arn: 'arn:aws:imagebuilder:us-east-1:123456789012:image-recipe/my-imagebuilder-recipe/1.0.0',
        name: 'my-imagebuilder-recipe',
        version: '1.0.0',
        description: 'My image builder recipe',
        platform: 'Linux',
        owner: 'Self',
        parent_image: 'arn:aws:imagebuilder:us-east-1:123456789012:image/my-parent-image/1.0.0',
        components: [
          {
            component_arn: 'arn:aws:imagebuilder:us-east-1:123456789012:component/my-component/1.0.0'
          }
        ],
        date_created: Time.parse('2018-10-28 00:23:32 -0400'),
        date_updated: Time.parse('2018-10-29 00:23:32 -0400')
      }
    }
  }
}
