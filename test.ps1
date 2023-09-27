function get-pctest {
    param (
        [string]$pcname ='localhost'
    )
    
    $os=Get-WmiObject -Class Win32_operatingSystem -ComputerName $pcname
    $bios=Get-WmiObject -Class Win32_BIOS -ComputerName $pcname
    $disk =Get-WmiObject -Class Win32_logicaldisk -Filter "DeviceID='c:'" -ComputerName $pcname

    $obj=New-Object -TypeName PSObject
    $obj | Add-Member -MemberType NoteProperty -Name Computername -Value $pcname
    $obj | Add-Member -MemberType NoteProperty -Name SPVersion -Value $os.servicepackmajorversion
    $obj | Add-Member -MemberType NoteProperty -Name OSVersion -Value $os.caption
    $obj | Add-Member -MemberType NoteProperty -Name OSBuild -Value $os.buildnumber
    $obj | Add-Member -MemberType NoteProperty -Name BiosSerial -Value $bios.serialnumber
    $obj | Add-Member -MemberType NoteProperty -Name SystemFree -Value $disk.freespace

    Write-Output $obj

}



get-pctest