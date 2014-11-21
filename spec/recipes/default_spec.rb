require_relative '../spec_helper'

describe 'jenkins_packer::default' do
  subject { ChefSpec::Runner.new.converge(described_recipe) }
end
