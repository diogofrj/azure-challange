#RG
location = "westus"
resource_group_name = "rg-shared"

#NETWORK
vnet_name = "vnet-shared"
address_space = ["10.0.0.0/16"]
shared_subnet_prefix = "10.0.1.0/24"
inbound_subnet_prefix = "10.0.2.0/24"
mgmt_subnet_prefix = "10.0.3.0/24"
# route_table_name = "rt-shared"
tags = {
  environment = "shared"
  project = "Azure Challenge"
}

#DNS
dns_zone_name = "challenge.internal"

