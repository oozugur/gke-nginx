variable "project" {
  description = "The project to deploy to"
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "names" {
  type = map(any)
}

variable "subnets" {
  type = map(any)
}
