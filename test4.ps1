$pcname= Read-Host 'Enter PC Name'

switch ($pcname) {
    'localhost' {
        Write-Output 'Local Machine Selected'
      }

      'Servertest'{
        Write-Output 'ServerTest Selected'

      }
    Default {
        Write-Host 'Unknown'
    }
}