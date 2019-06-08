resource "vsphere_virtual_machine" "vm1" {
  name             = "vm1"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"

  folder           = "${var.vsphere_atm_folder}"

  num_cpus = 2
  memory   = 1024
  guest_id = "${data.vsphere_virtual_machine.rhel_template.guest_id}"

  scsi_type = "${data.vsphere_virtual_machine.rhel_template.scsi_type}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
  }

  disk {
    label            = "disk0"
    size             = "${data.vsphere_virtual_machine.rhel_template.disks.0.size}"
    unit_number      = 0
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.rhel_template.id}"   
  }
}
