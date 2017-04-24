require 'serverspec'

# Required by serverspec
set :backend, :exec

describe "Linux distribution" do

  it "is CentOS" do
    expect(command('hostnamectl').stdout).to contain('CentOS')
  end

end
