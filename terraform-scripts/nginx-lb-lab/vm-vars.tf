variable "vm_spec" {
  type = map
  description = "VM specifications"
  default = {
    "instance_type"   = "n1-standard-1"
    "boot_disk_image" = "debian-11-bullseye-v20230509"
    "boot_disk_type"  = "pd-standard"
    "boot_disk_size"  = "10"
  }
}