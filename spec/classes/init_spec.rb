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
    it { is_expected.to contain_class('puppetvpn') }
  end
end
