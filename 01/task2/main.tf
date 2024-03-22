terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
  required_version = ">=0.13" /*Многострочный комментарий.
 Требуемая версия terraform */
}
provider "docker" {
  host     = "ssh://admin@158.160.17.129"
}

#однострочный комментарий

resource "random_password" "random_string1" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "random_password" "random_string2" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "docker_image" "mysql" {
  name         = "mysql:8"
  keep_locally = true
}

resource "docker_container" "mysql" {
  image = docker_image.mysql.image_id
  name  = "mysql"
  env = ["MYSQL_ROOT_PASSWORD=${random_password.random_string1.result}", "MYSQL_PASSWORD=${random_password.random_string2.result}", "MYSQL_DATABASE=wordpress", "MYSQL_USER=wordpress"]

  
  ports {
    internal = 3306
    external = 3306
  }
}

