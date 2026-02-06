ImagebuilderComponent resource type.

### exist

```ruby
describe imagebuilder_component('my-imagebuilder-component') do
  it { should exist }
end
```

### select version

```ruby
describe imagebuilder_component('my-imagebuilder-component @ v1.2.3') do
  it { should exist }
end

describe imagebuilder_component('my-imagebuilder-component > v1.2.3') do
  it { should exist }
end
```

### its(:arn), its(:name), its(:description), its(:platform), its(:version), its(:type)
