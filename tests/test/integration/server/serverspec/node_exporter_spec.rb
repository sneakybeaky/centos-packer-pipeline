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

  context "http connection" do
    subject {command('curl http://localhost:9100/metrics')}

    it "is listening" do
      expect(subject.exit_status).to eq 0
    end

    it "lists metrics" do
      expect(subject.stdout).to contain 'go_gc_duration'
    end
  end  

end
