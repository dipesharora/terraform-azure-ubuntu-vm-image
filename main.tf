###############################################################
## Create Public IP
###############################################################
resource "azurerm_public_ip" "vm_public_ip" {
  count               = var.vm_count
  name                = "${var.vm_prefix}${format("%02s", count.index + 1)}-pubip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"
  tags                = var.tags
}

###############################################################
## Create Network Interface
###############################################################
resource "azurerm_network_interface" "vm_nic" {
  count               = var.vm_count
  name                = "${var.vm_prefix}${format("%02s", count.index + 1)}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  ip_configuration {
    name                          = "${var.vm_prefix}${format("%02s", count.index + 1)}-config"
    subnet_id                     = var.nic_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id  = "${element(azurerm_public_ip.vm_public_ip.*.id, count.index)}"
  }
}

#########################################################
## Create Virtual Machine (Ubuntu)
#########################################################
resource "azurerm_linux_virtual_machine" "ubuntuvm" {
  count                            = var.vm_count
  location                         = var.location
  resource_group_name              = var.resource_group_name
  name                             = "${var.vm_prefix}${format("%02s", count.index + 1)}"
  size                          = var.vm_size
  admin_username = var.vm_admin_username
  admin_ssh_key {
    username   = var.vm_admin_username
    public_key = var.vm_public_key
  }
  network_interface_ids            = ["${element(azurerm_network_interface.vm_nic.*.id, count.index)}"]
  availability_set_id              = var.vm_availability_set_id
  tags                             = var.tags

  os_disk {
    name              = "${var.vm_prefix}${format("%02s", count.index + 1)}-osdisk"
    caching           = var.vm_os_disk_caching    
    storage_account_type = var.vm_os_disk_storage_account_type
    disk_size_gb      = var.vm_os_disk_size
  }

  source_image_id   =   var.vm_image_id
}

#########################################################
## Create Data Managed Drives and then attach them
#########################################################

resource "azurerm_managed_disk" "managed_disk_1" {
  count                = element(var.vm_data_disk_size_list, 0) != "" ? "${var.vm_count}" : 0
  name                 = "${var.vm_prefix}${format("%02s", count.index + 1)}-disk01"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.vm_data_disk_storage_account_type
  create_option        = var.vm_data_disk_create_option
  disk_size_gb         = element(var.vm_data_disk_size_list, 0)
  tags                 = var.tags
}

resource "azurerm_managed_disk" "managed_disk_2" {
  count                = element(var.vm_data_disk_size_list, 1) != "" ? "${var.vm_count}" : 0
  name                 = "${var.vm_prefix}${format("%02s", count.index + 1)}-disk02"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.vm_data_disk_storage_account_type
  create_option        = var.vm_data_disk_create_option
  disk_size_gb         = element(var.vm_data_disk_size_list, 1)
  tags                 = var.tags
}

resource "azurerm_managed_disk" "managed_disk_3" {
  count                = element(var.vm_data_disk_size_list, 2) != "" ? "${var.vm_count}" : 0
  name                 = "${var.vm_prefix}${format("%02s", count.index + 1)}-disk03"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.vm_data_disk_storage_account_type
  create_option        = var.vm_data_disk_create_option
  disk_size_gb         = element(var.vm_data_disk_size_list, 2)
  tags                 = var.tags
}

resource "azurerm_managed_disk" "managed_disk_4" {
  count                = element(var.vm_data_disk_size_list, 3) != "" ? "${var.vm_count}" : 0
  name                 = "${var.vm_prefix}${format("%02s", count.index + 1)}-disk04"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.vm_data_disk_storage_account_type
  create_option        = var.vm_data_disk_create_option
  disk_size_gb         = element(var.vm_data_disk_size_list, 3)
  tags                 = var.tags
}

resource "azurerm_managed_disk" "managed_disk_5" {
  count                = element(var.vm_data_disk_size_list, 4) != "" ? "${var.vm_count}" : 0
  name                 = "${var.vm_prefix}${format("%02s", count.index + 1)}-disk05"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.vm_data_disk_storage_account_type
  create_option        = var.vm_data_disk_create_option
  disk_size_gb         = element(var.vm_data_disk_size_list, 4)
  tags                 = var.tags
}

resource "azurerm_managed_disk" "managed_disk_6" {
  count                = element(var.vm_data_disk_size_list, 5) != "" ? "${var.vm_count}" : 0
  name                 = "${var.vm_prefix}${format("%02s", count.index + 1)}-disk06"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.vm_data_disk_storage_account_type
  create_option        = var.vm_data_disk_create_option
  disk_size_gb         = element(var.vm_data_disk_size_list, 5)
  tags                 = var.tags
}

resource "azurerm_managed_disk" "managed_disk_7" {
  count                = element(var.vm_data_disk_size_list, 6) != "" ? "${var.vm_count}" : 0
  name                 = "${var.vm_prefix}${format("%02s", count.index + 1)}-disk07"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.vm_data_disk_storage_account_type
  create_option        = var.vm_data_disk_create_option
  disk_size_gb         = element(var.vm_data_disk_size_list, 6)
  tags                 = var.tags
}

resource "azurerm_managed_disk" "managed_disk_8" {
  count                = element(var.vm_data_disk_size_list, 7) != "" ? "${var.vm_count}" : 0
  name                 = "${var.vm_prefix}${format("%02s", count.index + 1)}-disk08"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.vm_data_disk_storage_account_type
  create_option        = var.vm_data_disk_create_option
  disk_size_gb         = element(var.vm_data_disk_size_list, 7)
  tags                 = var.tags
}

resource "azurerm_managed_disk" "managed_disk_9" {
  count                = element(var.vm_data_disk_size_list, 8) != "" ? "${var.vm_count}" : 0
  name                 = "${var.vm_prefix}${format("%02s", count.index + 1)}-disk09"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.vm_data_disk_storage_account_type
  create_option        = var.vm_data_disk_create_option
  disk_size_gb         = element(var.vm_data_disk_size_list, 8)
  tags                 = var.tags
}

resource "azurerm_managed_disk" "managed_disk_10" {
  count                = element(var.vm_data_disk_size_list, 9) != "" ? "${var.vm_count}" : 0
  name                 = "${var.vm_prefix}${format("%02s", count.index + 1)}-disk10"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.vm_data_disk_storage_account_type
  create_option        = var.vm_data_disk_create_option
  disk_size_gb         = element(var.vm_data_disk_size_list, 9)
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "managed_disk_1_attachment" {
  count              = element(var.vm_data_disk_size_list, 0) != "" ? "${var.vm_count}" : 0
  managed_disk_id    = element(azurerm_managed_disk.managed_disk_1.*.id, count.index)
  virtual_machine_id = element(azurerm_linux_virtual_machine.ubuntuvm.*.id, count.index)
  lun                = "0"
  caching            = var.vm_data_disk_caching
  depends_on         = [azurerm_linux_virtual_machine.ubuntuvm]
}

resource "azurerm_virtual_machine_data_disk_attachment" "managed_disk_2_attachment" {
  count              = element(var.vm_data_disk_size_list, 1) != "" ? "${var.vm_count}" : 0
  managed_disk_id    = element(azurerm_managed_disk.managed_disk_2.*.id, count.index)
  virtual_machine_id = element(azurerm_linux_virtual_machine.ubuntuvm.*.id, count.index)
  lun                = "1"
  caching            = var.vm_data_disk_caching
  depends_on         = [azurerm_linux_virtual_machine.ubuntuvm, azurerm_virtual_machine_data_disk_attachment.managed_disk_1_attachment]
}

resource "azurerm_virtual_machine_data_disk_attachment" "managed_disk_3_attachment" {
  count              = element(var.vm_data_disk_size_list, 2) != "" ? "${var.vm_count}" : 0
  managed_disk_id    = element(azurerm_managed_disk.managed_disk_3.*.id, count.index)
  virtual_machine_id = element(azurerm_linux_virtual_machine.ubuntuvm.*.id, count.index)
  lun                = "2"
  caching            = var.vm_data_disk_caching
  depends_on         = [azurerm_linux_virtual_machine.ubuntuvm, azurerm_virtual_machine_data_disk_attachment.managed_disk_2_attachment]
}

resource "azurerm_virtual_machine_data_disk_attachment" "managed_disk_4_attachment" {
  count              = element(var.vm_data_disk_size_list, 3) != "" ? "${var.vm_count}" : 0
  managed_disk_id    = element(azurerm_managed_disk.managed_disk_4.*.id, count.index)
  virtual_machine_id = element(azurerm_linux_virtual_machine.ubuntuvm.*.id, count.index)
  lun                = "3"
  caching            = var.vm_data_disk_caching
  depends_on         = [azurerm_linux_virtual_machine.ubuntuvm, azurerm_virtual_machine_data_disk_attachment.managed_disk_3_attachment]
}

resource "azurerm_virtual_machine_data_disk_attachment" "managed_disk_5_attachment" {
  count              = element(var.vm_data_disk_size_list, 4) != "" ? "${var.vm_count}" : 0
  managed_disk_id    = element(azurerm_managed_disk.managed_disk_5.*.id, count.index)
  virtual_machine_id = element(azurerm_linux_virtual_machine.ubuntuvm.*.id, count.index)
  lun                = "4"
  caching            = var.vm_data_disk_caching
  depends_on         = [azurerm_linux_virtual_machine.ubuntuvm, azurerm_virtual_machine_data_disk_attachment.managed_disk_4_attachment]
}

resource "azurerm_virtual_machine_data_disk_attachment" "managed_disk_6_attachment" {
  count              = element(var.vm_data_disk_size_list, 5) != "" ? "${var.vm_count}" : 0
  managed_disk_id    = element(azurerm_managed_disk.managed_disk_6.*.id, count.index)
  virtual_machine_id = element(azurerm_linux_virtual_machine.ubuntuvm.*.id, count.index)
  lun                = "5"
  caching            = var.vm_data_disk_caching
  depends_on         = [azurerm_linux_virtual_machine.ubuntuvm, azurerm_virtual_machine_data_disk_attachment.managed_disk_5_attachment]
}

resource "azurerm_virtual_machine_data_disk_attachment" "managed_disk_7_attachment" {
  count              = element(var.vm_data_disk_size_list, 6) != "" ? "${var.vm_count}" : 0
  managed_disk_id    = element(azurerm_managed_disk.managed_disk_7.*.id, count.index)
  virtual_machine_id = element(azurerm_linux_virtual_machine.ubuntuvm.*.id, count.index)
  lun                = "6"
  caching            = var.vm_data_disk_caching
  depends_on         = [azurerm_linux_virtual_machine.ubuntuvm, azurerm_virtual_machine_data_disk_attachment.managed_disk_6_attachment]
}

resource "azurerm_virtual_machine_data_disk_attachment" "managed_disk_8_attachment" {
  count              = element(var.vm_data_disk_size_list, 7) != "" ? "${var.vm_count}" : 0
  managed_disk_id    = element(azurerm_managed_disk.managed_disk_8.*.id, count.index)
  virtual_machine_id = element(azurerm_linux_virtual_machine.ubuntuvm.*.id, count.index)
  lun                = "7"
  caching            = var.vm_data_disk_caching
  depends_on         = [azurerm_linux_virtual_machine.ubuntuvm, azurerm_virtual_machine_data_disk_attachment.managed_disk_7_attachment]
}

resource "azurerm_virtual_machine_data_disk_attachment" "managed_disk_9_attachment" {
  count              = element(var.vm_data_disk_size_list, 8) != "" ? "${var.vm_count}" : 0
  managed_disk_id    = element(azurerm_managed_disk.managed_disk_9.*.id, count.index)
  virtual_machine_id = element(azurerm_linux_virtual_machine.ubuntuvm.*.id, count.index)
  lun                = "8"
  caching            = var.vm_data_disk_caching
  depends_on         = [azurerm_linux_virtual_machine.ubuntuvm, azurerm_virtual_machine_data_disk_attachment.managed_disk_8_attachment]
}

resource "azurerm_virtual_machine_data_disk_attachment" "managed_disk_10_attachment" {
  count              = element(var.vm_data_disk_size_list, 9) != "" ? "${var.vm_count}" : 0
  managed_disk_id    = element(azurerm_managed_disk.managed_disk_10.*.id, count.index)
  virtual_machine_id = element(azurerm_linux_virtual_machine.ubuntuvm.*.id, count.index)
  lun                = "9"
  caching            = var.vm_data_disk_caching
  depends_on         = [azurerm_linux_virtual_machine.ubuntuvm, azurerm_virtual_machine_data_disk_attachment.managed_disk_9_attachment]
}