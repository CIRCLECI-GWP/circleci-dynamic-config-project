data "kubernetes_service" "app" {
  metadata{
    name = kubernetes_service.app.metadata[0].name
  }
}

output "do_cluster" {
  value = var.cluster_name
  sensitive = true
}

output "lb_public_ip" {
  value = data.kubernetes_service.app.status.0.load_balancer.0.ingress.0.ip
  description = "The public IP address of the DigitalOcean load balancer."
}
