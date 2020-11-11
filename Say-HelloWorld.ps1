"------------"
"Hello $(whoami)!"
"------------"
"Your local time is $(Get-Date)"
"Your machine's hostname is $(hostname)"
$OSplatform= [System.Environment]::OSVersion.Platform
"Your Operating System platform is $($OSplatform)"

if ($OSplatform -eq "Win32NT")
{
    "Your IP is $((Get-NetIPAddress -AddressFamily ipv4 -PrefixOrigin DHCP).ipaddress)"
    "Your DNS domains are: $((Get-Wmiobject Win32_NetworkAdapterConfiguration |Where-Object dnsdomain -ne $null).dnsdomain)" 
    "Local users of your machine are: $((get-localuser |Where-Object enabled -eq $true).name)"
}else
   {
    "Your distro details are: $(uname -a)"
    "More details in progress... Stand by!"
   }

"============"
