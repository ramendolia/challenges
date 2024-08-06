# Enunciado Challenge 2 # 

<p> We have a private registry based on Azure Container Registry where we publish
all our Helm charts. Let’s call this registry reference.azurecr.io.
When we create an AKS cluster, we also create another Azure Container Registry
where we need to copy the Helm charts we are going to install in that AKS from
the reference registry. Let’s call this registry instance.azurecr.io and assume it
resides in an Azure subscription with ID c9e7611c-d508-4fbf-aede-0bedfabc1560.
As we work with Terraform to install our charts in our AKS cluster, we’ve
thought that it would be quite helpful to have a reusable module that allows us
to import a set of charts from the reference registry to the instance registry
using a local provisioner and install them on our AKS cluster.
We will call our reusable module in the following way: </p>



``` 
module "chart" {

    . . .

    acr_server = "instance.azurecr.io"
    acr_server_subscription = "c9e7611c-d508-4fbf-aede-0bedfabc1560"
    source_acr_client_id = "1b2f651e-b99c-4720-9ff1-ede324b8ae30"
    source_acr_client_secret = "Zrrr8~5~F2Xiaaaa7eS.S85SXXAAfTYizZEF1cRp"
    source_acr_server = "reference.azurecr.io"`

    charts = [
        {
            chart_name = <chart_name>
            chart_namespace = <chart_namespace>
            chart_repository = <chart_repository>
            chart_version = <chart_version>
        
            values = [
                {
                    name = <name>
                    value = <value>
                },
                {
                    name = <name>
                    value = <value>
                }
            ] 

            sensitive_values = [
                {
                    name = <name>
                    value = <value>
                },
                {
                    name = <name>
                    value = <value>
                }
            ]
        },
        {
            . . .
        }
    ]}
```

<p> You need to implement the reusable module. It should pass validations provided
by the terraform fmt and terraform validate commands.

You can assume the caller will be authenticated in Azure with enough permissions
to import Helm charts into the instance registry and will provide the module a
configured helm provider. </p>