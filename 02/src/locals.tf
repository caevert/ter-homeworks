locals {
  vm_web_name = "netology-${ var.vpc_name }-platform-${ var.vm_web_role }"
  vm_db_name = "netology-${ var.vpc_name }-platform-${ var.vm_db_role }"
}
