variable "region" {
  default     = "us-east-2"
  type        = string
  description = "AWS Region to deploy Server"
}

variable "instance_type" {
  default     = "t2.micro"
  type        = string
  description = "Instance type"
}

variable "detailed_monitoring" {
  default     = false
  type        = bool
  description = "Enable monitoring"
}

variable "common_tag" {
  description = "Common Tags to apply to all resources"
  type        = map(any)
  default = {
    Owner       = "Vitalii Storozh"
    Project     = "DCRTV"
    Environment = "Development"
  }
}

variable "allow_ports" {
  default     = ["80", "443", "22", "8080", "8200", "8500", "8300", "8301"]
  type        = list(any)
  description = "Lists of port to servers"
}

variable "name_server1" {
  default     = "First Node"
  type        = string
  description = "Name for servers"
}

variable "name_server2" {
  default     = "Second Node"
  type        = string
  description = "Name for servers"
}

variable "name_server3" {
  default     = "Ansible Node"
  type        = string
  description = "Name for servers"
}
