# frozen_string_literal: true

Aws.config[:imagebuilder] = {
  stub_responses: {
    list_image_pipelines: {
      image_pipeline_list: [
        {
          arn: 'arn:aws:imagebuilder:us-east-1:123456789012:image-pipeline/my-imagebuilder-pipeline',
          name: 'my-imagebuilder-pipeline',
          description: 'My image builder pipeline',
          platform: 'Linux',
          date_created: Time.parse('2018-10-28 00:23:32 -0400'),
          date_updated: Time.parse('2018-10-29 00:23:32 -0400')
        }
      ]
    },
    get_image_pipeline: {
      image_pipeline: {
        arn: 'arn:aws:imagebuilder:us-east-1:123456789012:image-pipeline/my-imagebuilder-pipeline',
        name: 'my-imagebuilder-pipeline',
        description: 'My image builder pipeline',
        platform: 'Linux',
        image_recipe_arn: 'arn:aws:imagebuilder:us-east-1:123456789012:image-recipe/my-recipe/1.0.0',
        infrastructure_configuration_arn: 'arn:aws:imagebuilder:us-east-1:123456789012:infrastructure-configuration/my-infra',
        distribution_configuration_arn: 'arn:aws:imagebuilder:us-east-1:123456789012:distribution-configuration/my-distribution',
        status: 'ENABLED',
        date_created: Time.parse('2018-10-28 00:23:32 -0400'),
        date_updated: Time.parse('2018-10-29 00:23:32 -0400')
      }
    }
  }
}
