provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "minikube"
}

resource "kubernetes_pod" "test1" {
  metadata {
    name = "mypod1"
  }

  spec {
    container {
      image = "akhileshpatel123/akhil_project"
      name  = "mycontainer1"
    }
   }

}

resource "kubernetes_pod" "test2" {
  metadata {
    name = "mypod2"
  }

  spec {
    container {
      image = "akhileshpatel123/akhil_project"
      name  = "mycontainer2"
    }
   }
}

resource "kubernetes_cluster_role" "example" {
  metadata {
    name = "terraform-example"
  }
}


resource "kubernetes_persistent_volume" "example" {
  metadata {
    name = "terraform-example"
  }
  spec {
    capacity = {
      storage = "2Gi"
    }
    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      vsphere_volume {
        volume_path = "/absolute/path"
      }
    }
  }
}
