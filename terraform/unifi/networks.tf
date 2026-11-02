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

resource "unifi_network" "kids" {
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
    start               = "10.17.130.6"
    stop                = "10.17.130.254"
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
  firewall_zone_id = "68057e38c57f965f38ebb254"
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
  multicast_dns             = true
  name                      = "Kids"
  nat_outbound_ip_addresses = null
  network_isolation         = false
  purpose                   = "corporate"
  setting_preference        = "manual"
  site                      = "default"
  subnet                    = "10.17.130.1/24"
  third_party_gateway       = false
  timeouts                  = null
  vlan                      = 130
}

resource "unifi_network" "iot" {
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
    start               = "10.17.150.6"
    stop                = "10.17.150.254"
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
  firewall_zone_id = "68057ce5c57f965f38ebb22d"
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
  multicast_dns             = true
  name                      = "IoT"
  nat_outbound_ip_addresses = null
  network_isolation         = false
  purpose                   = "corporate"
  setting_preference        = "manual"
  site                      = "default"
  subnet                    = "10.17.150.1/24"
  third_party_gateway       = false
  timeouts                  = null
  vlan                      = 150
}

resource "unifi_network" "trusted" {
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
    start               = "10.17.20.200"
    stop                = "10.17.20.254"
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
  firewall_zone_id = "6803f1e4226666603c56d24d"
  gateway_type     = "default"
  igmp_snooping    = false
  internet_access  = true
  ip_aliases       = null
  ipv6 = {
    aliases        = null
    interface_type = "none"
    pd = {
      auto_prefixid_enabled = true
      interface             = null
      prefixid              = null
    }
    ra = {
      enabled = true
    }
    static_subnet = null
  }
  lte_lan                   = true
  multicast_dns             = true
  name                      = "Trusted"
  nat_outbound_ip_addresses = null
  network_isolation         = false
  purpose                   = "corporate"
  setting_preference        = "manual"
  site                      = "default"
  subnet                    = "10.17.20.1/24"
  third_party_gateway       = false
  timeouts                  = null
  vlan                      = 20
}
