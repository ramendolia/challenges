output "deployed_chart_names" {
  value = [for chart in var.charts : chart.chart_name]
}