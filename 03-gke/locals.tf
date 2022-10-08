locals {
  network         = data.terraform_remote_state.network.outputs.network
  node_network    = data.terraform_remote_state.network.outputs.node_network
  pod_network     = data.terraform_remote_state.network.outputs.pod_network
  service_network = data.terraform_remote_state.network.outputs.service_network
}
