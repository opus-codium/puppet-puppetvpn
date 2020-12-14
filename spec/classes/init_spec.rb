require 'spec_helper'

describe 'puppetvpn' do
  let(:facts) do
    {
      os: {
        family: 'Debian',
      },
      osfamily: 'Debian',
    }
  end
  context 'with defaults for all parameters' do
    it { should contain_class('puppetvpn') }
  end
end
