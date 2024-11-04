#RG
location = "westus"
location_short = "wus"
environment = "prod"
workload = "challenge"
resource_group_name = "rg-prod-wus-challenge"
tags = {
  environment = "Production"
  project = "Azure Challenge"
  workload = "challenge"
  terraform = "true"
}


#NETWORK
vnet_name = "vnet-prod-wus-challenge"
address_space = ["10.0.0.0/16"]
shared_subnet_prefix = "10.0.1.0/24"
internal_subnet_prefix = "10.0.2.0/24"
mgmt_subnet_prefix = "10.0.3.0/24"
dns_zone_name = "challenge.internal"


#AKS

service_cidr = "172.16.0.0/16"
dns_service_ip = "172.16.0.10"
docker_bridge_cidr = "172.17.0.1/16"
system_node_pool_vm_size = "Standard_B2s"
user_node_pool_vm_size = "Standard_B2ms"
system_node_pool_min_count = 1
system_node_pool_max_count = 2
user_node_pool_min_count = 1
user_node_pool_max_count = 2
auto_scaling_enabled = true



#Log Analytics
retention_in_days = 30


