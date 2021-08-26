#Triple A Aka Ademola Adam Asimolowo

#Variables
$computer_name = (Get-CimInstance -ClassName Win32_ComputerSystem).Name
Write-Output $computer_name
$soundRan = $false
$microphoneRan = $false
$videoRan = $false
$teamsOpen = $false



#Functions
function getDevicesInfo {

    $debounce = $false
    if ($debounce -eq $false)
    {
        $debounce = $true
        #& 'C:\Users\adamo\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\System Tools\Control Panel.lnk' @Args
        #Show-ControlPanelItem -Name "Device Manager"
        Write-Output "-----------------------Network Adapters-------------------------"
        Get-NetAdapter -Name * #gets the network adapters   
        Write-Output "`n-----------------------Sound Devices -------------------------"
        Get-CimInstance -ClassName Win32_SoundDevice #gets sound devices
    }
    else{
        $debounce = $false
        Write-Output "Network Adapters are already open!"
    }
}

function testingSound{
        Write-Output "`n-----------------------Sound Test-------------------------"
        Write-Output "`nTesting sound..."
        [console]::beep(300, 3000)
        $soundRan = $true
        Start-Sleep -s 1 #wait for 5 seconds
        if($soundRan -eq $true){
            Write-Output "Sound Test Passed"
        }
}


function testingMicrophone_and_Video{
    
    Get-PnpDevice -FriendlyName 
    #opening a URL through chrome
    [system.Diagnostics.Process]::Start("chrome", "https://utilities.clickmeeting.com/connection-tester?_ga=2.137188720.1910223738.1629943481-959624625.1629943481")
}


function testDataDrives{

}

function openMicrosoftTeams {

    if ($teamsOpen -eq $false){
        Write-Output "`n-----------------------Microsoft Teams Test-------------------------"

        Write-Output "`nOpening Teams.."
        Start-Sleep -s 0.5
        Write-Output "Teams Opened"
        $teamsOpen = $true
        $teams_application = Get-ChildItem -Path 'C:\Users\adamo\AppData\Local\Microsoft\Teams\current' -Name Teams.exe
        #-Path and -Name are like the properties we need in order to find the path we currently want to open!
        Start-Process -FilePath "C:\Users\adamo\AppData\Local\Microsoft\Teams\current\$teams_application"
    }

    else{
        Write-Output "Teams is already open!"
    }
}


getDevicesInfo
Start-Sleep -s 2.15
testingSound
testingMicrophone
Start-Sleep -s 10.0
openMicrosoftTeams


