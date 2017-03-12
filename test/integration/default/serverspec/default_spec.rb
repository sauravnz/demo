require_relative 'spec_helper'
require 'uri'

RSpec.configure do |c|
  c.before :all do
    set :backend, :exec
  end
end

describe user('tomcat') do
  it { should belong_to_group 'tomcat' }
end

describe service('tomcat_helloworld') do
  it { should be_enabled }
  it { should be_running }
end

describe command('java -version') do
  its(:exit_status) { should eq 0 }
end

describe file('/opt/tomcat_helloworld/webapps/sample.war') do
  it { should exist }
  it { should be_owned_by 'tomcat' }
end
#
# describe file('/apps/tomcat/instances/tomcat01/conf/logging.properties') do
#   its(:content) { should match p(/INFO/) }
# end
