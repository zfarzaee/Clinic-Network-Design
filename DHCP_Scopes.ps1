# ============================================
# PowerShell Script - DHCP Server Configuration for Clinic
# ============================================

Install-WindowsFeature -Name DHCP -IncludeManagementTools

Set-DhcpServerv4OptionValue -DomainName "clinic.local" -DnsServer "8.8.8.8","192.168.20.10"

# ========== 1. Admin Scope (VLAN 20) ==========
Add-DhcpServerv4Scope -Name "Admin" -StartRange 192.168.20.20 -EndRange 192.168.20.30 -SubnetMask 255.255.255.224 -LeaseDuration 24:00:00 -State Active
Set-DhcpServerv4OptionValue -ScopeId 192.168.20.0 -Router 192.168.20.1
Set-DhcpServerv4OptionValue -ScopeId 192.168.20.0 -DnsServer 8.8.8.8,192.168.20.10
Set-DhcpServerv4OptionValue -ScopeId 192.168.20.0 -DnsDomainName "clinic.local"
Add-DhcpServerv4ExclusionRange -ScopeId 192.168.20.0 -StartRange 192.168.20.1 -EndRange 192.168.20.19

# ========== 2. CCTV Scope (VLAN 30) ==========
Add-DhcpServerv4Scope -Name "CCTV" -StartRange 192.168.30.10 -EndRange 192.168.30.14 -SubnetMask 255.255.255.240 -LeaseDuration 24:00:00 -State Active
Set-DhcpServerv4OptionValue -ScopeId 192.168.30.0 -Router 192.168.30.1
Set-DhcpServerv4OptionValue -ScopeId 192.168.30.0 -DnsServer 8.8.8.8,192.168.20.10
Add-DhcpServerv4ExclusionRange -ScopeId 192.168.30.0 -StartRange 192.168.30.1 -EndRange 192.168.30.9

# ========== 3. Guest Scope (VLAN 40) ==========
Add-DhcpServerv4Scope -Name "Guest" -StartRange 192.168.40.10 -EndRange 192.168.40.14 -SubnetMask 255.255.255.240 -LeaseDuration 8:00:00 -State Active
Set-DhcpServerv4OptionValue -ScopeId 192.168.40.0 -Router 192.168.40.1
Set-DhcpServerv4OptionValue -ScopeId 192.168.40.0 -DnsServer 8.8.8.8,192.168.20.10
Add-DhcpServerv4ExclusionRange -ScopeId 192.168.40.0 -StartRange 192.168.40.1 -EndRange 192.168.40.9

# ========== 4. Management Scope (VLAN 50) ==========
Add-DhcpServerv4Scope -Name "Management" -StartRange 192.168.50.10 -EndRange 192.168.50.14 -SubnetMask 255.255.255.248 -LeaseDuration 24:00:00 -State Active
Set-DhcpServerv4OptionValue -ScopeId 192.168.50.0 -Router 192.168.50.1
Set-DhcpServerv4OptionValue -ScopeId 192.168.50.0 -DnsServer 8.8.8.8,192.168.20.10
Add-DhcpServerv4ExclusionRange -ScopeId 192.168.50.0 -StartRange 192.168.50.1 -EndRange 192.168.50.9

# ========== 5. Post Scope (VLAN 60) ==========
Add-DhcpServerv4Scope -Name "Post" -StartRange 192.168.60.10 -EndRange 192.168.60.14 -SubnetMask 255.255.255.252 -LeaseDuration 24:00:00 -State Active
Set-DhcpServerv4OptionValue -ScopeId 192.168.60.0 -Router 192.168.60.1
Set-DhcpServerv4OptionValue -ScopeId 192.168.60.0 -DnsServer 8.8.8.8,192.168.20.10
Add-DhcpServerv4ExclusionRange -ScopeId 192.168.60.0 -StartRange 192.168.60.1 -EndRange 192.168.60.9

# ========== IP Reservations for Critical Devices ==========
Add-DhcpServerv4Reservation -ScopeId 192.168.50.0 -IPAddress 192.168.50.2 -ClientId "00-1A-2B-3C-4D-01" -Description "Core-1"
Add-DhcpServerv4Reservation -ScopeId 192.168.50.0 -IPAddress 192.168.50.3 -ClientId "00-1A-2B-3C-4D-02" -Description "Core-2"
Add-DhcpServerv4Reservation -ScopeId 192.168.50.0 -IPAddress 192.168.50.10 -ClientId "AA-BB-CC-DD-EE-01" -Description "AP-Reception"
Add-DhcpServerv4Reservation -ScopeId 192.168.50.0 -IPAddress 192.168.50.11 -ClientId "AA-BB-CC-DD-EE-02" -Description "AP-Doctors"
Add-DhcpServerv4Reservation -ScopeId 192.168.20.0 -IPAddress 192.168.20.10 -ClientId "11-22-33-44-55-01" -Description "Server-DHCP"
Add-DhcpServerv4Reservation -ScopeId 192.168.20.0 -IPAddress 192.168.20.11 -ClientId "11-22-33-44-55-02" -Description "Server-NAS"