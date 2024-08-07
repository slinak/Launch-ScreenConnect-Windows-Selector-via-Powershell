<#
The easiest way to find this info is to log into your ScreenConnect instance and go to the Host page.  Once there, open the browser's dev 
console (typically by hitting F12).  Within that console type SC.context and hit enter.  It will display a json object that contains a few 
useful things.  

Specifically, the $protocol is the instanceUrlScheme (ie sc-xxxx).  The $relayUrl, relayPort, and asymmKey can be found in the clp object.  
When copying the asymmetric key (object k within SC.context.clp), be sure to url encode it with something like https://www.urlencoder.org/

#>

#region Parameters constant to each ScreenConnect instance

#SC.context.instanceUrlScheme
$protocol = "sc-45e9cbf539b44075://"

#SC.context.clp.h
$relayUrl = ""

#SC.context.clp.p
$relayPort = ""

#SC.context.clp.k
$asymmKey = ""

#endregion


#region Parameters specific to the session connection attempt (and session)

#Indicates which session you're trying to join.  If you click on a Session on the Host page, you'll see a Guid in the browser's URL bar.  
#That Guid is that specific Session's SessionID.
$sessionID = ""

#Retrieved at runtime from PageService method 'GetAccessToken'
$hostAccessToken = ""

#Always will be Support, Meeting, or Access
$sessionType = "Access"

#Represents the title of the host client.  By default this is the name of the Session but it can be any value.
$applicationTitle = ""

#Sets certain default beahvior, mainly SuspendedInput.  Typically defaults to None
$clientLaunchAttributes = ""

#Can be used to connect directly into a specific logon session (backstage is always 0)
$logonSessionID = ""

#endregion


#an example from a dummy instance:
#syntax: relay_url:relay_port/sessionID/urlencoded_asymmetric_key/urlencoded_host_access_token/participant_name/session_type/application_title/client_launch_attributes/logon_sessionID
$sessionInfo = "localhost:8041/c6b230a3-ef5f-4d7a-9f0f-df16c2dccccb/BgIAAACkBCBSU0ExAAgAAAEAAQCxyXisQ6ANZyUdqxWlqcsrhDAH%2B3%2FyJu7XMm7PI3EfyDx%2B%2Fn3RoctG8Pl0dGP68CkS3uS5Qe9P%2BHMkBOnu5naIuYMJqFoaF2ruv4b05GpAFDNzkQplrlsuLGh1pzMkyIcQNhmGIMUh%2FsRcLsdyhsRHYvKS0adhwOquCT5SceoCv8AR2IFMdgHe3N%2BHZHoWP03GDQIfGiw8jq9iAxwKXoxuW%2F3tqc%2FBMENgv3miVScKo1dqR4F2Bg4DkGmitskwj9lQqFU1V4q0P3IG%2FUHFiAUlvtiL6CKrm4UlHwFZHdojcjLVmlvGZMJML8wAB9NzpkrBb63g7%2B3d6IrWaIM3gYu1/BJwh1gnhNvxa0jKtVS4ZfhzwzGt5Q3%2BP4I%2FanTdJLHt%2BuIQD%2BZ1KcbS%2B1d1FtMSfU%2BvN%2FQaLmgtVTzNd1wwtUupZkKOpFSCW70%2FZ0D6usMiB6U76tBRSK%2FJ6PMZIbLO9tAPEEqky4DNbXvG%2FRA%2FHYq3ue%2BRWhZSvBX35YX1C0Wyd//Access/SERVER01/None/"

$arguments = $protocol + $sessionInfo

Start-Process -FilePath "C:\Program Files (x86)\ScreenConnect Client (45e9cbf539b44075)\ScreenConnect.WindowsClient.exe" -ArgumentList $arguments