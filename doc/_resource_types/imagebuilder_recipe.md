ImagebuilderRecipe resource type.

### exist

```ruby
describe imagebuilder_recipe('my-imagebuilder-recipe') do
  it { should exist }
end
```

### its(:arn), its(:name), its(:description), its(:platform), its(:version), its(:parent_image)
