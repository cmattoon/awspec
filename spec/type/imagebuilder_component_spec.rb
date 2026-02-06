# frozen_string_literal: true

require 'spec_helper'
Awspec::Stub.load 'imagebuilder_component'

describe imagebuilder_component('my-imagebuilder-component > v1.0.0') do
  it { should exist }
  its(:arn) { should eq 'arn:aws:imagebuilder:us-east-1:123456789012:component/my-imagebuilder-component/2.0.0' }
  its(:name) { should eq 'my-imagebuilder-component' }
  its(:description) { should eq 'My image builder component' }
  its(:platform) { should eq 'Linux' }
  its(:version) { should eq '2.0.0' }
  its(:type) { should eq 'BUILD' }
end
