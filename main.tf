resource "azurerm_linux_virtual_machine" "Instance" {
	name = local.InstanceName
	location = local.ResourceGroupLocation
	resource_group_name = local.ResourceGroupName
	tags = {
		Name = local.InstanceName
		Owner = local.UserEmailTag
		Project = local.UserProjectTag
		ResourceGroup = local.ResourceGroupName
		Location = local.ResourceGroupLocation
	}
	size = local.VmSize
	source_image_reference {
		publisher = local.MarketplaceImagePublisherId
		offer = local.MarketplaceImageOfferId
		sku = local.ImageSku
		version = local.ImageVersion
	}
	plan {
		publisher = local.MarketplaceImagePublisherId
		product = local.MarketplaceImageProductId
		name = local.ImagePlanId
	}
	disk_controller_type = "NVMe"
	os_disk {
		caching = "ReadWrite"
		storage_account_type = "Standard_LRS"
	}
	computer_name = replace(local.InstanceName, "_", "-")
	admin_username = local.AdminUserName
	disable_password_authentication = local.DisablePasswordAuthentication
	admin_ssh_key {
		username = local.AdminUserName
		public_key = data.azurerm_ssh_public_key.SshKey.public_key
	}
	network_interface_ids = [
		azurerm_network_interface.Eth0.id
	]
	boot_diagnostics {}
	depends_on = [
		azurerm_network_interface.Eth0
	]
	timeouts {
		create = "5m"
		delete = "10m"
	}
}

resource "azurerm_network_interface" "Eth0" {
	name = local.Eth0Name
	location = local.ResourceGroupLocation
	resource_group_name = local.ResourceGroupName
	tags = {
		Owner = local.UserEmailTag
		Project = local.UserProjectTag
		ResourceGroup = local.ResourceGroupName
		Location = local.ResourceGroupLocation
	}
	ip_configuration {
		name = "ipconfig1"
		private_ip_address_allocation = "Dynamic"
		public_ip_address_id = azurerm_public_ip.Eth0PublicIpAddress.id
		subnet_id = local.Eth0SubnetId
		primary = "true"
		private_ip_address_version = "IPv4"
	}
	dns_servers = []
	accelerated_networking_enabled = local.EnableAcceleratedNetworking
	ip_forwarding_enabled = local.EnableIpForwarding
	depends_on = [
		azurerm_public_ip.Eth0PublicIpAddress
	]
}

resource "azurerm_public_ip" "Eth0PublicIpAddress" {
	name = local.Eth0PublicIpAddressName
	location = local.ResourceGroupLocation
	resource_group_name = local.ResourceGroupName
	tags = {
		Owner = local.UserEmailTag
		Project = local.UserProjectTag
		ResourceGroup = local.ResourceGroupName
		Location = local.ResourceGroupLocation
	}
	ip_version = "IPv4"
	allocation_method = "Static"
	idle_timeout_in_minutes = 4
	domain_name_label = local.DnsLabel
}

resource "time_sleep" "SleepDelay" {
	create_duration = local.SleepDelay
	depends_on = [
		azurerm_linux_virtual_machine.Instance
	]
}