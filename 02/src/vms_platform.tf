#variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM web image family"
}

# variable "vm_web_name" {
#   type        = string
#   default     = "netology-develop-platform-web"
#   description = "VM web name"
# }

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "VM web platform_id"
}

variable "vm_web_role" {
  type        = string
  default     = "web"
  description = "VM web role"
}

# variable "vm_db_name" {
#   type        = string
#   default     = "netology-develop-platform-db"
#   description = "VM db name"
# }

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "VM db platform_id"
}

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "VM db zone"
}

variable "vm_db_role" {
  type        = string
  default     = "db"
  description = "VM db role"
}

variable "subnet_b_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vms_resources" {
  type        = map(object(
    {
      cores         = number
      memory        = number
      core_fraction = number
  }))
  description = "VMs resources"
}

variable "metadatas" {
  type        = object(
    {
      serial-port-enable = number
      ssh-keys           = string
  })
  description = "VMs metadata"
}
