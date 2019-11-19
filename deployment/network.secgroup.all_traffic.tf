# SECTION: Security Groups
resource "openstack_networking_secgroup_v2" "all_traffic" {
  name        = "all_traffic"
  description = "Allow all traffic between VMs"
}

resource "openstack_networking_secgroup_rule_v2" "allow-all-tcp-ipv4" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 1
  port_range_max    = 65535
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.all_traffic.id}"
}
 
resource "openstack_networking_secgroup_rule_v2" "allow-all-tcp-ipv6" {
  direction         = "ingress"
  ethertype         = "IPv6"
  protocol          = "tcp"
  port_range_min    = 1
  port_range_max    = 65535
  remote_ip_prefix  = "::/0"
  security_group_id = "${openstack_networking_secgroup_v2.all_traffic.id}"
}
 
resource "openstack_networking_secgroup_rule_v2" "allow-all-icmp-ipv4" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.all_traffic.id}"
}
 
resource "openstack_networking_secgroup_rule_v2" "allow-all-icmp-ipv6" {
  direction         = "ingress"
  ethertype         = "IPv6"
  protocol          = "icmp"
  remote_ip_prefix  = "::/0"
  security_group_id = "${openstack_networking_secgroup_v2.all_traffic.id}"
}