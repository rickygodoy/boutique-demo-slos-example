# boutique-demo-slos-example

This is a sample repository for building CUJs for the Online Boutique demo (https://github.com/GoogleCloudPlatform/microservices-demo)

It demonstrates how to apply the SRE principles with terraform


For more information on the application and it's archiecture check the original repository.

## Pre-requisites

### Terraform

Create the bucket for the terraform state in the project you have boutque deployed.

1. Edit the `backend.tf` file and change the value of `bucket` to the name of the bucket you created.
2. Edit the terraform.tfvars to set the mandatory values
3. Then run the following commands
```shell
cd terraform
gcloud auth application-default login
terraform init
terraform apply
```
Check the services page on Cloud Monitoring for the newly defined SLOs.


## SRE - CUJs, SLI,s SLOs

This is a list of potential User Journeys to be implemented for this application:

| Journeys                      | Critical?     | Developed?  |
| ----------------------------- |:-------------:| -----------:|
| Load home page                | Yes           |   Yes       |
| View product details          | Yes           |   Yes       |
| Add product to cart           | Yes           |   No        |
| Keep browsing                 | Yes           |   No        |
| View cart                     | Yes           |   No        |
| Place order                   | No            |   No        |
| Change currency               | No            |   No        |
| Change product quantity       | No            |   No        |
| Load "You might like"         | No            |   No        |
| Empty cart                    | No            |   No        |





## Repo structure

TODO

## TODO
- [] Add SLO Genrator samples
- [] Add pipeline using cloud build
- [] Add pipeline using gitlab



