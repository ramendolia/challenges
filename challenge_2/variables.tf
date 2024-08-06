variable "acr_server" {
  description = "The target Azure Container Registry server."
  type        = string
}

variable "charts" {
  description = "List of charts to import and install."
  type = list(object({
    chart_name      = string
    chart_namespace = string
    chart_repository = string
    chart_version   = string
    values          = list(object({
      name  = string
      value = string
    }))
    sensitive_values = list(object({
      name  = string
      value = string
    }))
  }))
}