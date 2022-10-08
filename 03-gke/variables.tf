variable "region" {
  type = string
}

variable "zones" {
  type = list(string)
}

variable "names" {
  type = map(any)
}

variable "subnets" {
  type = map(any)
}

variable "project" {
  type = string
}
