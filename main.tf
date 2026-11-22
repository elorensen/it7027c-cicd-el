
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nginx" {
  name         = "nginxdemos/hello:latest"
  keep_locally = false
}

resource "docker_container" "web" {
  name  = "it7027c-module13-web"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = 8080
  }
}
