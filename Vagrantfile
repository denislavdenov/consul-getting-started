Vagrant.configure("2") do |config|
  config.vm.box = "denislavd/xenial64"
  config.vm.define "n1" do |n1|
    n1.vm.hostname = "n1"
    n1.vm.network "private_network", ip: "192.168.56.56"
    n1.vm.provision :shell, path: "scripts/provision.sh"
  end

  config.vm.define "n2" do |n2|
    n2.vm.hostname = "n2"
    n2.vm.network "private_network", ip: "192.168.56.57"
    n2.vm.provision :shell, path: "scripts/provision.sh"
  end
end

