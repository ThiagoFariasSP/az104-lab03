resource "azurerm_linux_virtual_machine" "res-0" {
  admin_username        = "azureuser"
  location              = "eastus"
  name                  = "VM-AZ104-APP"
  network_interface_ids = [azurerm_network_interface.res-7.id]
  resource_group_name   = "RG-AZ104-PRIVATEENDPOINT"
  secure_boot_enabled   = true
  size                  = "Standard_B2ats_v2"
  vtpm_enabled          = true
  additional_capabilities {
  }
  admin_ssh_key {
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDgVSghNtIJM+HnyCXAg8KhYGGYBptkPWLqQAGgw7lN7wLfP+UfP0MLKD6o3F87wNZ7nTqSWOkahu1+1ItQgQYiNJqXUrPYY1K8t/jnx2k5zMBXt4A1QftcHkgYpkfTSbPe4V34n/a9w84U9Gq7veg/JN/zTjdcDBOQZYteHBdt9NjdPAT95nXVeaVBhQri8abzd3k5YyGdkjzjAlb4uCpu8K6ykruQhBCrjqmSOMyCTMJjbpX1lPyBQnk1a2g4wb3c3U2uvWnAD7eTQWPDl2b8dtLDkCFLmiglcJ6bWLR5JGrRmTTHDtkJzQWpRZvi3E0ugSpO8LgCZljzRXrZR0KPxEZKhus9OPUCIHd0K3/6EsM7hNnjnnXtmACqa+e9F/BfJ0sr056jNHHMjaOHRr4xMVDutfMj1qN7szJpFNzSybepj8D+3T4NL8VMdcbJf1eTx5OyqEbj0gnhznMCQ7lFnDgSARFY0sZ3eCvZrJ6PdCGI9DEUE9USu44MhRzHP2E= generated-by-azure"
    username   = "azureuser"
  }
  boot_diagnostics {
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }
  source_image_reference {
    offer     = "ubuntu-24_04-lts"
    publisher = "canonical"
    sku       = "server"
    version   = "latest"
  }
}
resource "azurerm_resource_group" "res-1" {
  location = "brazilsouth"
  name     = "rg-az104-privateendpoint"
}
resource "azurerm_ssh_public_key" "res-2" {
  location            = "eastus"
  name                = "vm-az104-app_key"
  public_key          = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDgVSghNtIJM+HnyCXAg8KhYGGYBptkPWLqQAGgw7lN7wLfP+UfP0MLKD6o3F87wNZ7nTqSWOkahu1+1ItQgQYiNJqXUrPYY1K8t/jnx2k5zMBXt4A1QftcHkgYpkfTSbPe4V34n/a9w84U9Gq7veg/JN/zTjdcDBOQZYteHBdt9NjdPAT95nXVeaVBhQri8abzd3k5YyGdkjzjAlb4uCpu8K6ykruQhBCrjqmSOMyCTMJjbpX1lPyBQnk1a2g4wb3c3U2uvWnAD7eTQWPDl2b8dtLDkCFLmiglcJ6bWLR5JGrRmTTHDtkJzQWpRZvi3E0ugSpO8LgCZljzRXrZR0KPxEZKhus9OPUCIHd0K3/6EsM7hNnjnnXtmACqa+e9F/BfJ0sr056jNHHMjaOHRr4xMVDutfMj1qN7szJpFNzSybepj8D+3T4NL8VMdcbJf1eTx5OyqEbj0gnhznMCQ7lFnDgSARFY0sZ3eCvZrJ6PdCGI9DEUE9USu44MhRzHP2E= generated-by-azure"
  resource_group_name = azurerm_resource_group.res-1.name
}
resource "azurerm_ssh_public_key" "res-3" {
  location            = "eastus"
  name                = "vm-az104-pe_key"
  public_key          = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDlAEHy52iY0U8tAeFS3U0jYhf11pCW+m02mTaIFghWU/9XNjeIJ1DD2McsVgmLepDPyLBs9qwUqSg2U3hCoTU6Y6qmBzRzQ2Hta81jQ7qytCeHOnp99aWFmOAYRjpunyo652Ntv+fV8dElS+mHkP7QRETLqgxq70F7HOlS0vwswYmvYyC5aCNd+Ob3Kvn3RD0CiGP4TNojDDMI8beNjC+eXPnvpDHLW03+Ij/Pz7Z5pH+OcQOca7uQH4OVZ+Xf7fJv+lfzdMD5DNRDpp8ikXM/GCRN6Mt6DEiRsgnqCZlCvJaGESSz3ER4+zz0WAw4ptqEd++M49Xcl+ppY3BfIK5GIy1PW8CInXl3mLm5ZT3FVBz5C6wbdYzlwz2Pj/VIzP5O044WQYZV1JXOJXicRja9PndWe9LlIWPYTEH2OjMWIC6G0G4VqTxHpoaYT2/S12ILD8Z8q3rkGyNSuB532DABlNeXbE9MjCTM+AimHF6fPWZTafAqvLkvtFzk+43g3v0= generated-by-azure"
  resource_group_name = azurerm_resource_group.res-1.name
}
resource "azurerm_linux_virtual_machine" "res-4" {
  admin_username        = "azureuser"
  location              = "eastus"
  name                  = "vm-az104-pe"
  network_interface_ids = [azurerm_network_interface.res-8.id]
  resource_group_name   = azurerm_resource_group.res-1.name
  secure_boot_enabled   = true
  size                  = "Standard_B2ts_v2"
  vtpm_enabled          = true
  zone                  = "1"
  additional_capabilities {
  }
  admin_ssh_key {
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDlAEHy52iY0U8tAeFS3U0jYhf11pCW+m02mTaIFghWU/9XNjeIJ1DD2McsVgmLepDPyLBs9qwUqSg2U3hCoTU6Y6qmBzRzQ2Hta81jQ7qytCeHOnp99aWFmOAYRjpunyo652Ntv+fV8dElS+mHkP7QRETLqgxq70F7HOlS0vwswYmvYyC5aCNd+Ob3Kvn3RD0CiGP4TNojDDMI8beNjC+eXPnvpDHLW03+Ij/Pz7Z5pH+OcQOca7uQH4OVZ+Xf7fJv+lfzdMD5DNRDpp8ikXM/GCRN6Mt6DEiRsgnqCZlCvJaGESSz3ER4+zz0WAw4ptqEd++M49Xcl+ppY3BfIK5GIy1PW8CInXl3mLm5ZT3FVBz5C6wbdYzlwz2Pj/VIzP5O044WQYZV1JXOJXicRja9PndWe9LlIWPYTEH2OjMWIC6G0G4VqTxHpoaYT2/S12ILD8Z8q3rkGyNSuB532DABlNeXbE9MjCTM+AimHF6fPWZTafAqvLkvtFzk+43g3v0= generated-by-azure"
    username   = "azureuser"
  }
  boot_diagnostics {
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
  source_image_reference {
    offer     = "ubuntu-24_04-lts"
    publisher = "canonical"
    sku       = "server"
    version   = "latest"
  }
}
resource "azurerm_dev_test_global_vm_shutdown_schedule" "res-5" {
  daily_recurrence_time = "1900"
  location              = "eastus"
  timezone              = "E. South America Standard Time"
  virtual_machine_id    = "/subscriptions/0b350b04-f7bc-4060-a575-741c4fcd3bdd/resourceGroups/rg-az104-privateendpoint/providers/Microsoft.Compute/virtualMachines/vm-az104-app"
  lifecycle {
    ignore_changes = [timezone]
  }
  notification_settings {
    email   = "thiago.f.da.silva@avanade.com"
    enabled = true
  }
  depends_on = [
    azurerm_resource_group.res-1,
  ]
}
resource "azurerm_dev_test_global_vm_shutdown_schedule" "res-6" {
  daily_recurrence_time = "1900"
  location              = "eastus"
  timezone              = "E. South America Standard Time"
  virtual_machine_id    = azurerm_linux_virtual_machine.res-4.id
  lifecycle {
    ignore_changes = [timezone]
  }
  notification_settings {
    email   = "thiago.f.da.silva@avanade.com"
    enabled = true
  }
}
resource "azurerm_network_interface" "res-7" {
  location            = "eastus"
  name                = "vm-az104-app570"
  resource_group_name = azurerm_resource_group.res-1.name
  ip_configuration {
    name                          = "ipconfig1"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.res-20.id
    subnet_id                     = "/subscriptions/0b350b04-f7bc-4060-a575-741c4fcd3bdd/resourceGroups/rg-az104-privateendpoint/providers/Microsoft.Network/virtualNetworks/vnet-eastus-1/subnets/snet-app"
  }
  depends_on = [
    # One of azurerm_subnet.res-23,azurerm_subnet_network_security_group_association.res-24 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_network_interface" "res-8" {
  accelerated_networking_enabled = true
  location                       = "eastus"
  name                           = "vm-az104-pe787"
  resource_group_name            = azurerm_resource_group.res-1.name
  ip_configuration {
    name                          = "ipconfig1"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.res-21.id
    subnet_id                     = azurerm_subnet.res-25.id
  }
}
resource "azurerm_network_interface_security_group_association" "res-9" {
  network_interface_id      = azurerm_network_interface.res-8.id
  network_security_group_id = azurerm_network_security_group.res-12.id
}
resource "azurerm_network_security_group" "res-10" {
  location            = "eastus"
  name                = "nsg-snet-app"
  resource_group_name = azurerm_resource_group.res-1.name
}
resource "azurerm_network_security_rule" "res-11" {
  access                      = "Allow"
  description                 = "Allows inbound SSH (TCP/22) access to the lab VM from the authorized workstation for AZ-104 network security and troubleshooting exercises."
  destination_address_prefix  = "*"
  destination_port_range      = "22"
  direction                   = "Inbound"
  name                        = "Allow-SSH-MyPC"
  network_security_group_name = "nsg-snet-app"
  priority                    = 100
  protocol                    = "Tcp"
  resource_group_name         = azurerm_resource_group.res-1.name
  source_address_prefix       = "206.62.99.26/32"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.res-10,
  ]
}
resource "azurerm_network_security_group" "res-12" {
  location            = "eastus"
  name                = "vm-az104-pe-nsg"
  resource_group_name = azurerm_resource_group.res-1.name
}
resource "azurerm_network_security_rule" "res-13" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "22"
  direction                   = "Inbound"
  name                        = "SSH"
  network_security_group_name = "vm-az104-pe-nsg"
  priority                    = 300
  protocol                    = "Tcp"
  resource_group_name         = azurerm_resource_group.res-1.name
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.res-12,
  ]
}
resource "azurerm_private_dns_zone" "res-14" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = azurerm_resource_group.res-1.name
}
resource "azurerm_private_dns_a_record" "res-15" {
  name                = "stthiagoaz104pe01"
  records             = ["172.16.0.5"]
  resource_group_name = azurerm_resource_group.res-1.name
  tags = {
    creator = "created by private endpoint pe-az104-blob with resource guid 8a721496-0e64-4525-b78c-c4398b55941b"
  }
  ttl       = 10
  zone_name = "privatelink.blob.core.windows.net"
  depends_on = [
    azurerm_private_dns_zone.res-14,
  ]
}
resource "azurerm_private_dns_zone_virtual_network_link" "res-17" {
  name                  = "gscovxh4jwj4c"
  private_dns_zone_name = "privatelink.blob.core.windows.net"
  resource_group_name   = azurerm_resource_group.res-1.name
  virtual_network_id    = azurerm_virtual_network.res-22.id
  depends_on = [
    azurerm_private_dns_zone.res-14,
  ]
}
resource "azurerm_private_endpoint" "res-18" {
  custom_network_interface_name = "pe-az104-blob-nic"
  location                      = "eastus"
  name                          = "pe-az104-blob"
  resource_group_name           = azurerm_resource_group.res-1.name
  subnet_id                     = azurerm_subnet.res-25.id
  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [azurerm_private_dns_zone.res-14.id]
  }
  private_service_connection {
    is_manual_connection           = false
    name                           = "pe-az104-blob"
    private_connection_resource_id = "/subscriptions/0b350b04-f7bc-4060-a575-741c4fcd3bdd/resourcegroups/rg-az104-privateendpoint/providers/Microsoft.Storage/storageAccounts/stthiagoaz104pe01"
    subresource_names              = ["blob"]
  }
}
resource "azurerm_public_ip" "res-20" {
  allocation_method   = "Static"
  location            = "eastus"
  name                = "vm-az104-app-ip"
  resource_group_name = azurerm_resource_group.res-1.name
}
resource "azurerm_public_ip" "res-21" {
  allocation_method   = "Static"
  location            = "eastus"
  name                = "vm-az104-pe-ip"
  resource_group_name = azurerm_resource_group.res-1.name
  zones               = ["1"]
}
resource "azurerm_virtual_network" "res-22" {
  address_space       = ["172.16.0.0/16"]
  location            = "eastus"
  name                = "vnet-eastus-1"
  resource_group_name = azurerm_resource_group.res-1.name
}
resource "azurerm_subnet" "res-23" {
  address_prefixes                = ["172.16.2.0/24"]
  default_outbound_access_enabled = false
  name                            = "snet-app"
  resource_group_name             = azurerm_resource_group.res-1.name
  virtual_network_name            = "vnet-eastus-1"
  depends_on = [
    azurerm_virtual_network.res-22,
  ]
}
resource "azurerm_subnet_network_security_group_association" "res-24" {
  network_security_group_id = azurerm_network_security_group.res-10.id
  subnet_id                 = azurerm_subnet.res-23.id
}
resource "azurerm_subnet" "res-25" {
  address_prefixes     = ["172.16.0.0/24"]
  name                 = "snet-eastus-1"
  resource_group_name  = azurerm_resource_group.res-1.name
  virtual_network_name = "vnet-eastus-1"
  depends_on = [
    azurerm_virtual_network.res-22,
  ]
}
resource "azurerm_subnet" "res-26" {
  address_prefixes     = ["172.16.1.0/24"]
  name                 = "snet-eastus-3"
  resource_group_name  = azurerm_resource_group.res-1.name
  virtual_network_name = "vnet-eastus-1"
  depends_on = [
    azurerm_virtual_network.res-22,
  ]
}
resource "azurerm_storage_account" "res-27" {
  account_replication_type        = "GRS"
  account_tier                    = "Standard"
  allow_nested_items_to_be_public = false
  location                        = "eastus"
  name                            = "stthiagoaz104pe01"
  public_network_access_enabled   = false
  resource_group_name             = azurerm_resource_group.res-1.name
}
resource "azurerm_storage_account_queue_properties" "res-31" {
  storage_account_id = azurerm_storage_account.res-27.id
  hour_metrics {
    version = "1.0"
  }
  logging {
    delete  = false
    read    = false
    version = "1.0"
    write   = false
  }
  minute_metrics {
    version = "1.0"
  }
}


