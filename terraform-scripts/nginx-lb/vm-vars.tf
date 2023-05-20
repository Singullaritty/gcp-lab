variable "virtual_machines" {
  type = list(object({
    name = string
    instance_type = string
    boot_disk_image = string
    boot_disk_type = string
    boot_disk_size = string
    tags = list(string)
  }))
  default = [
    {
        name= "nginx-load-balancer",
        instance_type = "n1-standard-1",
        boot_disk_image = "debian-11-bullseye-v20230509",
        boot_disk_type = "pd-standard",
        boot_disk_size = "10",
        tags = ["nginx-lb"]
    },
     {
        name= "nginx-app-server-1",
        instance_type = "n1-standard-1",
        boot_disk_image = "debian-11-bullseye-v20230509",
        boot_disk_type = "pd-standard",
        boot_disk_size = "10",
        tags = ["app01"]
    },
    {
        name= "nginx-app-server-2",
        instance_type = "n1-standard-1",
        boot_disk_image = "debian-11-bullseye-v20230509",
        boot_disk_type = "pd-standard",
        boot_disk_size = "10",
        tags = ["app02"]
    }
  ]
}