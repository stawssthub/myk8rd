environment                               = "dev"
#environment_abbreviation                  = "infra"
#iterator                                  = "001"
location                                  = "eastus"
subscription_id                           = "a83aa8d1-fd5e-42ff-a17c-0907465900ea"

vnet_address_space                        = ["10.0.0.0/16"]
subnet_address_prefix = {
      k8-snet            =  ["10.0.0.0/24"]
}

docker_bridge_cidr  = ["172.17.0.1/16"]
service_cidr        = "10.1.0.0/16"
dns_service_ip      = "10.1.0.10"

tags = {
  Environment   = "dev"
  "Environment Type"   = "Development"
  BuiltBy       = "Terraform"
  BusinessUnit  = "k8"
  ManagedBy     = "Terraform"
}