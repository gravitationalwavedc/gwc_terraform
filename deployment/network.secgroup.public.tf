# SECTION: Security Groups
resource "openstack_networking_secgroup_v2" "public" {
  name        = "public"
  description = "Secgroup for node facing a public network"
}

resource "openstack_networking_secgroup_rule_v2" "public-ingress-ssh" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.public.id}"
}


resource "openstack_networking_secgroup_rule_v2" "public-ingress-http" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.public.id}"
}

resource "openstack_networking_secgroup_rule_v2" "public-ingress-https" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 443
  port_range_max    = 443
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.public.id}"
}

resource "openstack_networking_secgroup_rule_v2" "public-kubernetes-dashboard" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 6443
  port_range_max    = 6443
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.public.id}"
}

resource "openstack_networking_secgroup_rule_v2" "public-lb-nginx" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 30000
  port_range_max    = 30000
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.public.id}"
}
