resource "yandex_compute_instance" "web" {
  count = var.count_vm_num

  depends_on = [yandex_compute_instance.db]

  name        = "${var.count_vm.vm_name}-${count.index+1}"
  platform_id = var.count_vm.platform_id

  resources {
    cores         = var.count_vm.cpu
    memory        = var.count_vm.ram
    core_fraction = var.count_vm.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type     = "network-hdd"
      size     = var.count_vm.disk_volume
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${local.public_key}"
  }

  scheduling_policy { preemptible = var.count_vm.preemptible }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.count_vm.nat
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
  allow_stopping_for_update = var.count_vm.allow_stopping
}
