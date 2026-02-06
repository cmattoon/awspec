# frozen_string_literal: true

require 'spec_helper'
Awspec::Stub.load 'imagebuilder_recipe'

describe imagebuilder_recipe('my-imagebuilder-recipe') do
  it { should exist }
  its(:arn) { should eq 'arn:aws:imagebuilder:us-east-1:123456789012:image-recipe/my-imagebuilder-recipe/1.0.0' }
  its(:name) { should eq 'my-imagebuilder-recipe' }
  its(:description) { should eq 'My image builder recipe' }
  its(:platform) { should eq 'Linux' }
  its(:version) { should eq '1.0.0' }
  its(:parent_image) { should eq 'arn:aws:imagebuilder:us-east-1:123456789012:image/my-parent-image/1.0.0' }
end
