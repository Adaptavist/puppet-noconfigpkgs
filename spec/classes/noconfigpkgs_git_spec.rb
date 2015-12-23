require 'spec_helper'
 
describe 'noconfigpkgs::git', :type => 'class' do
    
  context "Should install package git on RedHat osfamily" do
    let(:facts) { {:osfamily => 'RedHat'} }
  
    it do
      should contain_package('git').with_ensure('latest')
    end
  end
  context "Should install package git on RedHat osfamily" do
    let(:facts) { {:osfamily => 'Debian'} }
  
    it do
      should contain_package('git-core').with_ensure('latest')
    end
  end
end
