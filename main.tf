terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.14.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}


resource "docker_container" "hello_world_app" {
  image = "hello_world_app:latest"
  name  = "hello_world_app"
  restart = "always"
  volumes {
    container_path  = "/myapp"
    host_path = "/path/to/your/project/directory" 
    read_only = false
  }
  ports {
    internal = 8080
    external = 8080
  }
}

