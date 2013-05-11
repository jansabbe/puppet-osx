require 'spec_helper'

describe 'osx::dock::tile_size' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should contain_boxen__osx_defaults('Sets the size of the icons in the dock').with_value(46)
  end

  describe 'with parameters' do
    let(:params) { {:tile_size => 52} }

    it 'allows you to pass a custom tile size' do
      should contain_boxen__osx_defaults('Sets the size of the icons in the dock').with({
        :domain => 'com.apple.dock',
        :key    => 'tilesize',
        :value  => params[:tile_size],
        :user   => facts[:boxen_user]
      })
    end
  end
end
