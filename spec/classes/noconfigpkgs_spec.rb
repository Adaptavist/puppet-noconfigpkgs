require 'spec_helper'
 
error_default_packages = 'to_fail_here'
default_packages = default_packages = {
        'Debian' => ['git-core'],
        'RedHat' => ['git'],
      }

default_packages_single = default_packages = {
        'Debian' => 'git-core',
        'RedHat' => 'git',
      }

describe 'noconfigpkgs', :type => 'class' do
    
  context "should require valid hash as default_packages param" do
    let(:params) {{:default_packages => error_default_packages}}
        it { expect { should contain_package('') }.to raise_error(Puppet::Error) }
  end

  context "Should install packages on RedHat but not Debian ones" do
    let(:facts) { {:osfamily => 'RedHat'} }
    let(:params) {{:default_packages => default_packages}}  
    it do
      should contain_package('git').with_ensure('installed')
      should_not contain_package('git-core').with_ensure('installed')
    end
  end
  
  context "Should install packages on Debian but not Debian ones" do
    let(:facts) { {:osfamily => 'Debian'} }
    let(:params) {{:default_packages => default_packages}}  
    it do
      should_not contain_package('git').with_ensure('installed')
      should contain_package('git-core').with_ensure('installed')
    end
  end

end
