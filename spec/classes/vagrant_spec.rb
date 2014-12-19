require 'spec_helper'

describe 'vagrant' do
  let (:facts) { default_test_facts }

  describe 'when not specifiying a version' do
    it { should contain_package('Vagrant_1.7.1').with({
      :ensure   => 'installed',
      :provider => 'pkgdmg'
    })}
  end

  describe 'when specifying a specific version' do
    let (:params) {{:version => '1.6.2'}}

    it { should contain_package('Vagrant_1.6.2')}
    it { should contain_package('Vagrant_1.6.2').with_source('https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.2.dmg')}
  end

  describe 'when installing bash completion' do
    let (:params) {{:completion => true}}

    it { should contain_package('Vagrant_1.7.1')}
    it { should contain_package('Vagrant_1.7.1').with_source('https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.1.dmg')}
    it { should contain_package('vagrant-completion').with_provider('homebrew')}
  end

end
