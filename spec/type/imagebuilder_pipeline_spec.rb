require 'spec_helper'
Awspec::Stub.load 'imagebuilder_pipeline'

describe imagebuilder_pipeline('my-imagebuilder-pipeline') do
  it { should exist }
  its(:arn) { should eq 'arn:aws:imagebuilder:us-east-1:123456789012:image-pipeline/my-imagebuilder-pipeline' }
  its(:name) { should eq 'my-imagebuilder-pipeline' }
  its(:description) { should eq 'My image builder pipeline' }
  its(:platform) { should eq 'Linux' }
  its(:image_recipe_arn) { should eq 'arn:aws:imagebuilder:us-east-1:123456789012:image-recipe/my-recipe/1.0.0' }
  its(:infrastructure_configuration_arn) { should eq 'arn:aws:imagebuilder:us-east-1:123456789012:infrastructure-configuration/my-infra' }
  its(:distribution_configuration_arn) { should eq 'arn:aws:imagebuilder:us-east-1:123456789012:distribution-configuration/my-distribution' }
  its(:status) { should eq 'ENABLED' }
end
