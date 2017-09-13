---
layout: "alicloud"
page_title: "Alicloud: alicloud_instance_types"
sidebar_current: "docs-alicloud-datasource-instance-types"
description: |-
    Provides a list of Ecs Instance Types for use in alicloud_instance resource.
---

# alicloud\_instance\_types

The Instance Types data source list the ecs_instance_types of Alicloud.
~> **NOTE:**
* Default to provide upgraded instance types. If you want to get outdated instance types, you should set `is_outdated` to true.


## Example Usage

```
# Declare the data source
data "alicloud_instance_types" "1c2g" {
  cpu_core_count = 1
  memory_size = 2
}

# Create ecs instance with the first matched instance_type

resource "alicloud_instance" "instance" {
  instance_type = "${data.alicloud_instance_types.1c2g.instance_types.0.id}"

  # Other properties...
}

```

## Argument Reference

The following arguments are supported:

* `availability_zone` - (Optional) The Zone that supports available instance types.
* `cpu_core_count` - (Optional) Limit search to specific cpu core count.
* `memory_size` - (Optional) Limit search to specific memory size.
* `instance_type_family` - (Optional) Allows to filter list of Instance Types based on their
family name, for example 'ecs.n4'.
* `is_outdated` - (Optional) Whether to export outdated instance types. Default to false.
* `output_file` - (Optional) The name of file that can save instance types data source after running `terraform plan`.

## Attributes Reference

A list of instance types will be exported and its every element contains the following attributes:

* `id` - ID of the instance type.
* `cpu_core_count` - Number of CPU cores.
* `memory_size` - Size of memory, measured in GB.
* `family` - The instance type family.
