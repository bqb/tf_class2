# modules/geomeoso-az-connectedrg/variables.tf
#

# variables.tf
variable "rg_names" {
    type = list(string)
}

variable vnets {
  type = list(map(string))
}

variable prefix {
    type = string
    default = "geomeoso"
}

variable region {
    type = string
    default = "westus2"
}

variable tags {
    type = map
    default = {
        company = "geomeoso research"
    }
}
