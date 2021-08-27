# set execution policy; adjust as needed to work in your environment
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine

# get hostname
$Hostname =[System.Net.Dns]::GetHostByName($env:computerName)|ForEach-Object{$_.HostName}

# metricpath: SystemEdge|<Hostname>|Storage|Disk Filesystem
$MetricPath = "SystemEdge|$($Hostname)|Storage|Disk Filesystem"

# print DeviceID, FreeSpace, Size
$disks =Get-WmiObject Win32_LogicalDisk -ComputerName localhost
ForEach ($disk in $disks) {
    # replace colon with underscore after disk label
    $drive = $disk.DeviceID -replace ':','_'

    # calculate free %
    $pctFree =[Math]::Round( ($disk.FreeSpace * 100) / $disk.Size )

    # print out in EPA XML format
    Write-Host "<metric type=`"IntCounter`" name=`"$($MetricPath) $($drive):FreeSpacePercent`" value=`"$($pctFree)`"/>"
}