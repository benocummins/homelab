# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "name=Work"
resource "unifi_network" "work" {
  auto_scale    = false
  dhcp_guarding = null
  dhcp_relay    = null
  dhcp_server = {
    boot = {
      enabled = false
    }
    conflict_checking = true
    dns = {
      enabled = false
      servers = null
    }
    enabled         = true
    gateway_enabled = false
    leasetime       = "24h0m0s"
    ntp = {
      enabled = false
      servers = null
    }
    start               = "10.17.200.6"
    stop                = "10.17.200.254"
    tftp_server         = null
    time_offset_enabled = false
    unifi_controller    = null
    wins = {
      addresses = null
      enabled   = false
    }
    wpad_url = null
  }
  dhcp_v6_server   = null
  enabled          = true
  firewall_zone_id = "680b807ef218dd0f96948ef7"
  gateway_type     = "default"
  igmp_snooping    = false
  internet_access  = true
  ip_aliases       = null
  ipv6 = {
    aliases                   = null
    client_address_assignment = "slaac"
    interface_type            = "none"
    pd = {
      auto_prefixid_enabled = true
      interface             = null
      prefixid              = null
      start                 = "::2"
      stop                  = "::7d1"
    }
    ra = {
      enabled            = true
      preferred_lifetime = "4h0m0s"
      priority           = "high"
    }
    static_subnet = null
  }
  lte_lan                   = true
  multicast_dns             = false
  name                      = "Work"
  nat_outbound_ip_addresses = null
  network_isolation         = false
  purpose                   = "corporate"
  setting_preference        = "manual"
  site                      = "default"
  subnet                    = "10.17.200.1/24"
  third_party_gateway       = false
  timeouts                  = null
  vlan                      = 200
}
