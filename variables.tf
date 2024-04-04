# calling module
# variables.tf
variable "rg_names" {
    type = list(string)
}

variable vnets {
  type = list(map(string))
}
