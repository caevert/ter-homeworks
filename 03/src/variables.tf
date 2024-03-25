###cloud vars1
# variable "token" {
#   type        = string
#   description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
# }

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "each_vm" {
  type = list(object({ vm_name=string, cpu=number, ram=number, disk_volume=number, core_fraction=number,
    preemptible=bool, nat=bool, allow_stopping=bool, platform_id=string }))
}

variable "count_vm" {
  type = object({ vm_name=string, cpu=number, ram=number, disk_volume=number, core_fraction=number,
    preemptible=bool, nat=bool, allow_stopping=bool, platform_id=string })
}

variable "storage_vm" {
  type = object({ vm_name=string, cpu=number, ram=number, disk_volume=number, core_fraction=number,
    preemptible=bool, nat=bool, allow_stopping=bool, platform_id=string })
}

variable "count_vm_num" {
  type = number
  default = 2
}

variable "extra_disk_spec" {
  type = object({ name=string, size=number, count=number })
}

variable "web_provision" {
  type    = bool
  default = true
  description="ansible provision switch variable"
}
