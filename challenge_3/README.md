# Enunciado Challenge 3#

Create a Github workflow to allow installing helm chart from Challenge #1
using module from Challenge #2, into an AKS cluster (considering a preexisting
resource group and cluster name).

## Workflow for Deploy ##


```
[Repositorio de GitHub]
         |
         v
[Push a la rama principal, en este caso "Master"]
         |
         v
[WebHook: Triggers Jenkins Job]
         |
         v
[Definir variables y preparación]
         |
         v
[Autenticación en Azure]
         |
         v
[Configuración del proveedor de Terraform]
         |
         v
[Generar el plan de Terraform para AKS]
         |
         v
[Aplicar Terraform para instalar los recursos]
         |
         v
[Configurar el proveedor de Helm]
         |
         v
[Instalar Helm chart en AKS]
         |
         v
[Verificación de la instalación del chart]
         |
         v
[Notificar éxito o error]
```