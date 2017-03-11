require_relative 'spec_helper'
require 'uri'

RSpec.configure do |c|
  c.before :all do
    set :backend, :exec
  end
end

describe service('tomcat_helloworld') do
  it { should be_enabled }
  it { should be_running }
end

describe command('java -version') do
  its(:exit_status) { should eq 0 }
end

# describe file('/apps/install/tomcat7/bin/catalina.sh') do
#   its(:content) { should match p(/-Xms2048m -Xmx2048m -Xmn1g -Xss256k -XX:ParallelGCThreads=2/) }
# end
#
# describe file('/apps/tomcat/instances/tomcat01/conf/logging.properties') do
#   its(:content) { should match p(/INFO/) }
# end
