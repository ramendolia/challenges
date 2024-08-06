provider "azurerm" {
  features {}
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"  # assuming the AKS is configured in kubeconfig
  }
}

resource "null_resource" "import_helm_charts" {
  count = length(var.charts)

  provisioner "local-exec" {
    command = <<EOT
      helm pull ${var.charts[count.index].chart_repository}/${var.charts[count.index].chart_name} --version ${var.charts[count.index].chart_version} --destination ./charts
      az acr helm push ./charts/${var.charts[count.index].chart_name}-${var.charts[count.index].chart_version}.tgz --name ${var.charts[count.index].chart_name} --registry ${var.acr_server}
      helm install ${var.charts[count.index].chart_name} --namespace ${var.charts[count.index].chart_namespace} --set ${join(",", [for v in var.charts[count.index].values : "${v.name}=${v.value}"])}
      EOT
  }

  lifecycle {
    ignore_changes = [provisioner]
  }
}