1output "test_output" {

  value = [ for i in concat(yandex_compute_instance.web, values(yandex_compute_instance.db)):
      {
        instance_name = i.name
        external_ip = i.network_interface[0].nat_ip_address
        fqdn = i.fqdn
      }
    ]
}
