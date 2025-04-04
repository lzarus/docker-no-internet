# Try these Powershell commands from an elevated console:
# Check interface metric
Get-NetIPInterface -AddressFamily IPv4 | Sort-Object -Property InterfaceMetric -Descending

# Again, you want your host's primary internet-connected network adapter to have the lowest InterfaceMetric value.
# Use this command to make the change (example assumes primary adapter InterfaceAlias is 'Wi-Fi'):

Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -InterfaceMetric 3

# That should do it. If your host's primary network adapter is bridged because you have an External virtual switch setup in Hyper-V, then you will set the external virtual switch to have the lowest InterfaceMetric value.
# You can verify your routing tables by using this command (the last line should show the primary adapter's gateway address along with it's ifMetric value):

Get-NetRoute -AddressFamily IPv4

#getfrom https://github.com/docker/for-win/issues/2760#issuecomment-430889666
