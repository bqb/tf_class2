# terraform.tfvars
rg_names = [ 
  "research_dev_rg",
  "research_staging_rg",
  "research_prod_rg"

]

tags = {
  cost_center = "Pauls wallet - geomeoso research"
}

vnets = [
  {
    name = "gmdev_vnet"
    address = "10.10.0.0/24"
  },
  {
    name = "gmstaging_vnet"
    address = "10.10.1.0/24"
  },
  {
    name = "gmprod_vnet"
    address = "10.10.2.0/24"
  },
]