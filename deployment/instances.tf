# SECTION: Instance
resource "openstack_compute_instance_v2" "lb_1" {
  name = "lb-1"
  image_id  = "99d9449a-084f-4901-8bd8-c04aebd589ca" # Ubuntu 18.04 LTS (Bionic) amd64 (with Kubernetes)
  flavor_id = "639b8b2a-a5a6-4aa2-8592-ca765ee7af63" # m2.small
  key_pair  = "GWC-K8-SSH"
  network {
    port = "${openstack_networking_port_v2.pub_cp_1.id}"
  }
}

resource "openstack_compute_instance_v2" "m_1" {
  name      = "m-1"
  image_id  = "99d9449a-084f-4901-8bd8-c04aebd589ca" # Ubuntu 18.04 LTS (Bionic) amd64 (with Kubernetes)
  flavor_id = "b7336043-bcba-4e5b-bdae-b76ccc328168" # m3.medium
  key_pair  = "GWC-K8-SSH"
  network {
    port = "${openstack_networking_port_v2.priv_cp_1.id}"
  }
}


resource "openstack_compute_instance_v2" "n_1" {
  name      = "n-1"
  image_id  = "99d9449a-084f-4901-8bd8-c04aebd589ca" # Ubuntu 18.04 LTS (Bionic) amd64 (with Kubernetes)
  flavor_id = "b7336043-bcba-4e5b-bdae-b76ccc328168" # m3.medium
  key_pair  = "GWC-K8-SSH"
  network {
    port = "${openstack_networking_port_v2.priv_n_1.id}"
  }
}

resource "openstack_compute_instance_v2" "n_2" {
  name      = "n-2"
  image_id  = "99d9449a-084f-4901-8bd8-c04aebd589ca" # Ubuntu 18.04 LTS (Bionic) amd64 (with Kubernetes)
  flavor_id = "b7336043-bcba-4e5b-bdae-b76ccc328168" # m3.medium
  key_pair  = "GWC-K8-SSH"
  network {
    port = "${openstack_networking_port_v2.priv_n_2.id}"
  }
}

# CONFIGURATION HOST
resource "openstack_compute_instance_v2" "awx_1" {
  name = "awx-1"
  image_id  = "99d9449a-084f-4901-8bd8-c04aebd589ca" # Ubuntu 18.04 LTS (Bionic) amd64 (with Kubernetes)
  flavor_id = "b7336043-bcba-4e5b-bdae-b76ccc328168" # m3.medium
  key_pair  = "GWC-K8-SSH"
  network {
    port = "${openstack_networking_port_v2.pub_awx_1.id}"
  }
}

# STORAGE HOST
resource "openstack_compute_instance_v2" "nfs_1" {
  name = "nfs-1"
  image_id  = "99d9449a-084f-4901-8bd8-c04aebd589ca" # Ubuntu 18.04 LTS (Bionic) amd64 (with Kubernetes)
  flavor_id = "639b8b2a-a5a6-4aa2-8592-ca765ee7af63" # m2.small
  key_pair  = "GWC-K8-SSH"
  network {
    port = "${openstack_networking_port_v2.priv_nfs_1.id}"
  }
}