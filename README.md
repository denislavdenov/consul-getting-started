# Sample repo on how to create a Consul Cluster with two nodes

### Fork the repo and clone it onto your machine
### Prerequisites before starting :
    - Vagrant installed
    - Virtualbox installed


You have a Vagrantfile which we are using to create 2 VMs.
There is a `scripts` folder where is located the script for provisioning the VMs:
    - We install some prerequisites onto the VMs and Consul

## Get this to working now:

    - `cd consul-getting-started`
    - `vagrant up`
    - `vagrant ssh n1`
    - `consul agent -server -bootstrap-expect=1 \
    -data-dir=/tmp/consul -node=agent-one -bind=192.168.56.56 \
    -enable-script-checks=true -config-dir=/vagrant/consul.d`
    
    Open new terminal window.

    - `vagrant ssh n2`
    - `consul agent -data-dir=/tmp/consul -node=agent-two \
    -bind=172.20.20.11 -enable-script-checks=true -config-dir=/vagrant/consul.d`
    
**At this point, you have two Consul agents running: one server and one client. The two Consul agents still don't know anything about each other and are each part of their own single-node clusters.**

# Join a Cluster:

On n1 node:
    - `consul join 192.168.56.57`
On n2 node:
    - `consul members`

# Querying Nodes:

On n1 node:
    - `dig @127.0.0.1 -p 8600 agent-two.node.consul`


# Leaving a Cluster

To leave the cluster, you can either gracefully quit an agent (using Ctrl-C) or force kill one of the agents. Gracefully leaving allows the node to transition into the left state; otherwise, other nodes will detect it as having failed.
