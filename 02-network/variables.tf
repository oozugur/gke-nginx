variable "project" {
  description = "The project to deploy to"
  default     = "example-project-321312"
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
