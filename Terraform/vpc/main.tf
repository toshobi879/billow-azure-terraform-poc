resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.environment}-network"
  location = var.location
  tags     = var.tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.environment}"
  address_space       = [var.vnet_cidr]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}

# Public Subnets
resource "azurerm_subnet" "public" {
  for_each             = var.public_subnets
  name                 = "snet-${var.environment}-public-${each.key}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value]
}

# Private Subnets
resource "azurerm_subnet" "private" {
  for_each             = var.private_subnets
  name                 = "snet-${var.environment}-private-${each.key}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value]
}

# NAT Gateway (for private subnets outbound)
resource "azurerm_public_ip" "nat_pip" {
  name                = "pip-${var.environment}-nat"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}

resource "azurerm_nat_gateway" "nat" {
  name                = "nat-${var.environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "Standard"
  tags                = var.tags
}

resource "azurerm_nat_gateway_public_ip_association" "nat_assoc" {
  nat_gateway_id       = azurerm_nat_gateway.nat.id
  public_ip_address_id = azurerm_public_ip.nat_pip.id
}

resource "azurerm_subnet_nat_gateway_association" "private_nat_assoc" {
  for_each       = azurerm_subnet.private
  subnet_id      = each.value.id
  nat_gateway_id = azurerm_nat_gateway.nat.id
}

# NSG for Public Subnets
resource "azurerm_network_security_group" "public_nsg" {
  name                = "nsg-${var.environment}-public"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags

  security_rule {
    name                       = "Allow-HTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-HTTPS"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "public_assoc" {
  for_each                  = azurerm_subnet.public
  subnet_id                 = each.value.id
  network_security_group_id = azurerm_network_security_group.public_nsg.id
}

# NSG for Private Subnets
resource "azurerm_network_security_group" "private_nsg" {
  name                = "nsg-${var.environment}-private"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags

  security_rule {
    name                       = "Allow-From-VNet"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = var.vnet_cidr
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "private_assoc" {
  for_each                  = azurerm_subnet.private
  subnet_id                 = each.value.id
  network_security_group_id = azurerm_network_security_group.private_nsg.id
}