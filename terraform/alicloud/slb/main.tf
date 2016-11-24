variable "name" {
  default = "slb_alicloud"
}
variable "instances" {
  type = "list"
  default = [
    "i-25kojm48j",
    "i-2zedq821wnpah25zglps"]
}

variable "internet_charge_type" {
  default = "paybybandwidth"
}

variable "bandwidth" {
  default = 10
}

variable "internet" {
  default = true
}


resource "alicloud_slb" "instance" {
  name = "${var.name}"
  instances = "${var.instances}"
  internet_charge_type = "${var.internet_charge_type}"
  bandwidth = "${var.bandwidth}"
  internet = "${var.internet}"
  listener = [
    {
      "instance_port" = "3375"
      "instance_protocol" = "tcp"
      "lb_port" = "3376"
      "lb_protocol" = "tcp"
      "bandwidth" = "5"
    },
    {
      "instance_port" = "81"
      "instance_protocol" = "http"
      "lb_port" = "8080"
      "lb_protocol" = "http"
      "bandwidth" = "5"
    }]
}

output "slbname" {
  value = "${alicloud_slb.instance.name}"
}

output "instances" {
  value = "${alicloud_slb.instance.instances}"
}