require 'serverspec'

# Required by serverspec
set :backend, :exec

describe "Node Exporter" do

  context "service" do
    subject {service('node_exporter')}

    it "is enabled" do
      expect(subject).to be_enabled
    end

    it "is running" do
      expect(subject).to be_running
    end
  end

end
