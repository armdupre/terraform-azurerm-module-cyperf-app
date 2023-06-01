variable "AdminUserName" {
	default = "azure"
	type = string
}

variable "EnableAcceleratedNetworking" {
	default = false
	type = bool
}

variable "EnableIpForwarding" {
	default = false
	type = bool
}

variable "Eth0SubnetId" {
	type = string
}

variable "ImageSku" {
	default = "keysight-cyperf-controller-21"
	description = "An instance of an offer, such as a major release of a distribution."
	type = string
}

variable "ImageVersion" {
	default = "0.2.1"
	description = "The version number of an image SKU."
	type = string
}

variable "InstanceId" {
	default = "app"
	type = string
}

variable "MarketplaceImageOfferId" {
	default = "keysight-cyperf"
	description = "The name of a group of related images created by a publisher."
	type = string
}

variable "MarketplaceImagePublisherId" {
	default = "keysighttechnologies_cyperf"
	description = "The organization that created the image."
	type = string
}

variable "ResourceGroupLocation" {
	default = "East US"
	type = string
}

variable "ResourceGroupName" {
	type = string
}

variable "SshKeyName" {
	type = string
}

variable "Tag" {
	default = "cyperf"
	type = string
}

variable "UserEmailTag" {
	description = "Email address tag of user creating the deployment"
	type = string
}

variable "UserLoginTag" {
	description = "Login ID tag of user creating the deployment"
	type = string
}

variable "UserProjectTag" {
	default = "cloud-ist"
	type = string
}

variable "VmSize" {
	default = "Standard_F8s_v2"
	type = string
	validation {
		condition = can(regex("Standard_F16s_v2", var.VmSize)) || can(regex("Standard_F8s_v2", var.VmSize))
		error_message = "VmSize must be one of (Standard_F16s_v2 | Standard_F8s_v2) sizes."
	}
}