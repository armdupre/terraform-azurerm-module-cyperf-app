locals {
	AdminUserName = var.AdminUserName
	DisablePasswordAuthentication = true
	DnsLabel = join("", [lower(replace(local.ResourceGroupName, "_", "-")), "-", lower("${local.Tag}-${local.InstanceId}"), "-", local.uuid])
	EnableAcceleratedNetworking = var.EnableAcceleratedNetworking
	EnableIpForwarding = var.EnableIpForwarding
	Eth0Name = "${local.Preamble}-eth0"
	Eth0PublicIpAddressName = "${local.Preamble}-eth0-public-ip"
	Eth0SubnetId = var.Eth0SubnetId
	ImagePlanId = local.ImageSku
	ImageSku = var.ImageSku
	ImageVersion = var.ImageVersion
	InstanceId = var.InstanceId
	InstanceName = "${local.Preamble}-instance"
	MarketplaceImageOfferId = var.MarketplaceImageOfferId
	MarketplaceImageProductId = local.MarketplaceImageOfferId
	MarketplaceImagePublisherId = var.MarketplaceImagePublisherId
	Preamble = "${local.UserLoginTag}-${local.Tag}-${local.InstanceId}"
	ResourceGroupLocation = var.ResourceGroupLocation
	ResourceGroupName = var.ResourceGroupName
	SleepDelay = "7m"
	SshKeyName = var.SshKeyName
	Tag = var.Tag
	UserEmailTag = var.UserEmailTag
	UserLoginTag = var.UserLoginTag
	UserProjectTag = var.UserProjectTag
	VmSize = var.VmSize
	uuid = "${substr(uuid(), 1, 6)}"
}