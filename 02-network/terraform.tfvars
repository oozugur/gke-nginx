region          = "europe-west1"
zone            = "europe-west1-b"
project         = "example-project-321312"

names = {
  "node"     = "node-subnet"
  "pod"      = "pod-subnet"
  "service"  = "service-subnet"
}
subnets = {
  "node"    = "10.0.0.0/22"
  "pod"     = "10.100.0.0/18"
  "service" = "10.200.0.0/20"
}