# frozen_string_literal: true

Aws.config[:imagebuilder] = {
  stub_responses: {
    list_components: {
      component_summary_list: [
        {
          arn: 'arn:aws:imagebuilder:us-east-1:123456789012:component/my-imagebuilder-component/1.0.0',
          name: 'my-imagebuilder-component',
          version: '1.0.0',
          description: 'My image builder component',
          platform: 'Linux',
          owner: 'Self',
          date_created: Time.parse('2018-10-28 00:23:32 -0400')
        }
      ]
    },
    get_component: {
      component: {
        arn: 'arn:aws:imagebuilder:us-east-1:123456789012:component/my-imagebuilder-component/1.0.0',
        name: 'my-imagebuilder-component',
        version: '1.0.0',
        description: 'My image builder component',
        platform: 'Linux',
        owner: 'Self',
        change_description: 'Initial version',
        data: 'name: ExampleComponent',
        type: 'BUILD',
        date_created: Time.parse('2018-10-28 00:23:32 -0400')
      }
    }
  }
}
