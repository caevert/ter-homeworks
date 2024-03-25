1resource "yandex_compute_disk" "extra-disk" {
  count = var.extra_disk_spec.count
  name       = "${var.extra_disk_spec.name}-${count.index}"
  type       = "network-hdd"
  size       = var.extra_disk_spec.size
}

resource "yandex_compute_instance" "storage" {
  name        = var.storage_vm.vm_name
  platform_id = var.storage_vm.platform_id


  resources {
    cores         = var.storage_vm.cpu
    memory        = var.storage_vm.ram
    core_fraction = var.storage_vm.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type     = "network-hdd"
      size     = var.storage_vm.disk_volume
    }
  }

   dynamic "secondary_disk" {
    for_each = yandex_compute_disk.extra-disk
    content {
      disk_id     = secondary_disk.value.id
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${local.public_key}"
  }

  scheduling_policy { preemptible = var.storage_vm.preemptible }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.storage_vm.nat
  }
  allow_stopping_for_update = var.storage_vm.allow_stopping
}
