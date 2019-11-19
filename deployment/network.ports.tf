# SECTION: Network Ports

# LOAD BALANCER
resource "openstack_networking_port_v2" "pub_cp_1" {
  name = "pub-cp-1"
  network_id         = "5033cd0e-e4c7-4ff6-ae11-b384fa8613e0"
  admin_state_up     = "true"
  security_group_ids = [
    "${openstack_networking_secgroup_v2.public.id}"
    ]
}

# CONTROL PLANE
resource "openstack_networking_port_v2" "priv_cp_1" {
  name = "priv-cp-1"
  network_id     = "4362cc1c-105c-4c7a-aac9-af6544178416" 
  admin_state_up = "true"
  security_group_ids = [
    "${openstack_networking_secgroup_v2.all_traffic.id}"
    ]
}

# K8 WORKERS
resource "openstack_networking_port_v2" "priv_n_1" {
  name = "priv-n-1"
  network_id     = "4362cc1c-105c-4c7a-aac9-af6544178416" 
  admin_state_up = "true"
  security_group_ids = [
    "${openstack_networking_secgroup_v2.all_traffic.id}"
    ]
}
resource "openstack_networking_port_v2" "priv_n_2" {
  name = "priv-n-2"
  network_id     = "4362cc1c-105c-4c7a-aac9-af6544178416" 
  admin_state_up = "true"
  security_group_ids = [
    "${openstack_networking_secgroup_v2.all_traffic.id}"
    ]
}

resource "openstack_networking_port_v2" "priv_nfs_1" {
  name = "priv-nfs-1"
  network_id     = "4362cc1c-105c-4c7a-aac9-af6544178416" 
  admin_state_up = "true"
  security_group_ids = [
    "${openstack_networking_secgroup_v2.all_traffic.id}"
    ]
}

# ANSIBLE WORKER
resource "openstack_networking_port_v2" "pub_awx_1" {
  name = "pub-awx-1"
  network_id         = "5033cd0e-e4c7-4ff6-ae11-b384fa8613e0"
  admin_state_up     = "true"
  security_group_ids = [
    "${openstack_networking_secgroup_v2.public.id}"
    ]
}
