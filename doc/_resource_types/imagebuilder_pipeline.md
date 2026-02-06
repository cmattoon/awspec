ImagebuilderPipeline resource type.

### exist

```ruby
describe imagebuilder_pipeline('my-imagebuilder-pipeline') do
  it { should exist }
end
```

### its(:arn), its(:name), its(:description), its(:platform), its(:image_recipe_arn), its(:infrastructure_configuration_arn), its(:distribution_configuration_arn), its(:status)
