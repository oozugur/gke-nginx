resource "kubernetes_service" "nginx" {
  metadata {
    name = "nginx"
  }
  spec {
    load_balancer_source_ranges = ["159.146.13.32/32", "212.146.63.50/32"]
    selector = {
      App = kubernetes_deployment.nginx.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
