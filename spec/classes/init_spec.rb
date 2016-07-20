require 'spec_helper'
describe 'puppetvpn' do

  context 'with defaults for all parameters' do
    it { should contain_class('puppetvpn') }
  end
end
