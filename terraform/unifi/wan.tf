resource "unifi_wan" "internet_1" {
  dhcpv6 = {
    pd = {
      size_auto = false
    }
    wan_delegation_type = "none"
  }
  dns = {
    ipv6 = {
      preference = "auto"
    }
    preference = "manual"
    primary    = "1.1.1.1"
    secondary  = "9.9.9.9"
  }
  dslite = {
    remote_host_auto = true
  }
  enabled = true
  igmp_proxy = {
    downstream             = "none"
    downstream_network_ids = []
    upstream               = false
  }
  interface_mtu_enabled   = false
  ipv6_setting_preference = "manual"
  load_balance = {
    failover_priority = 1
    type              = "weighted"
    weight            = 99
  }
  mac_override_enabled = false
  name                 = "Internet 1"
  networkgroup         = "WAN"
  provider_capabilities = {
    download_kilobits_per_second = 1000000
    upload_kilobits_per_second   = 1000000
  }
  report_wan_event   = false
  setting_preference = "manual"
  site               = "default"
  type               = "dhcp"
  type_v6            = "disabled"
  vlan = {
    enabled = false
    id      = 0
  }
}
