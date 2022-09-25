#########################################################
## Variables Declarations
#########################################################

# Shared
variable "location" {
  type        = string
  description = "Set this to the location where your Azure resources will be created e.g. centralus, eastus, eastus2 etc."
}

# Resource Group
variable "resource_group_name" {
  type        = string
  description = "Set this to the name of the Resource Group in which Virtual Machine and dependent resources will be created."
}

# Tags
variable "tags" {
  type        = map
  description = "Set this to the mapping of tags to assign to the resource."
}

#Network Interface
variable "nic_subnet_id" {
  type        = string
  description = "Set this to the ID of the Subnet where this Network Interface should be located in."
}

# Virtual Machine
variable "vm_count" {
  type        = number
  description = "Set this to the no. of Virtual Machines to be deployed."
  default     = 0
}
variable "vm_prefix" {
  type        = string
  description = "Set this to the prefix to be used for VM Name. It will be appended with vm, osdisk etc. while creating the resources."
}
variable "vm_size" {
  type        = string
  description = "Set this to the size of the Virtual Machine. Refer https://docs.microsoft.com/en-us/azure/virtual-machines/windows/sizes."
}
variable "vm_availability_set_id" {
  type        = string
  description = "Set this to the ID of the Availability Set in which the Virtual Machine should exist. Do not set this field if Availability Sets are not being used or if using Availability Zones."
  default     = null
}
variable "vm_os_disk_caching" {
  type        = string
  description = "Set this to the caching requirements for the OS Disk."
  default     = "ReadWrite"
}
variable "vm_os_disk_storage_account_type" {
  type        = string
  description = "Set this to the type of managed disk to create."
  default     = "Standard_LRS"
}
variable "vm_os_disk_size" {
  type        = number
  description = "Set this to the size of the OS Disk in gigabytes."
  default     = 128
}
variable "vm_image_id" {
  type        = string
  description = "Set this to the ID of the Image which this Virtual Machine should be created from."
}

# VM User Credentials
variable "vm_admin_username" {
  type        = string
  description = "Set this to the name of the local administrator account on the VM."
}
variable "vm_public_key" {
  type        = string
  description = "Set this to the SSH Public Key on the VM."
}

#Managed Drives
variable "vm_data_disk_size_list" {
  type        = list
  description = "Set this to the list of sizes of the Data disks."
}
variable "vm_data_disk_storage_account_type" {
  type        = string
  description = "Set this to the type of managed disk to create."
  default     = "Standard_LRS"
}
variable "vm_data_disk_create_option" {
  type        = string
  description = "Set this to how the Data Disk should be created."
  default     = "Empty"
}
variable "vm_data_disk_caching" {
  type        = string
  description = "Set this to the caching requirements for the Data Disk."
  default     = "ReadWrite"
}