resource "yandex_compute_instance" "db" {
  for_each   = {
    for index, vm in var.each_vm:
    vm.vm_name => vm
  }
  # for_each = toset(var.each_vm)

  name        = each.value.vm_name
  platform_id = each.value.platform_id

  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type     = "network-hdd"
      size     = each.value.disk_volume
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${local.public_key}"
  }

  scheduling_policy { preemptible = each.value.preemptible }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = each.value.nat
  }
  allow_stopping_for_update = each.value.allow_stopping
}
