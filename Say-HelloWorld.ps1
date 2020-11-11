"------------"
"Hello $(whoami)!"
"------------"
"Your local time is $(Get-Date)"
"Your machine's hostname is $(hostname)"
$OSplatform= [System.Environment]::OSVersion.Platform
"Your Operating System platform is $($OSplatform)"

if ($OSplatform -eq "Win32NT")
{
    "Your IP address: $(([System.Net.Dns]::GetHostByName((hostname))).addresslist.ipaddresstostring)"
    "Your DNS domain names: $((Get-Wmiobject Win32_NetworkAdapterConfiguration |Where-Object dnsdomain -ne $null).dnsdomain)" 
    "Local users of your machine: $((get-localuser |Where-Object enabled -eq $true).name)"
}else
   {
    "Your machine details: $(uname -a)"
    "More details in progress... Stand by!"
   }

"============"
