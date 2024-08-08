This is intended to supplement the PowerShell wrapper from here: https://github.com/christaylorcodes/ConnectWiseControlAPI

It assumes that you have the WindowsSelector installed already and instructs how to generate the client launch parameters and how to pass them to the WindowsClient.exe proc

The WindowsSelector works just like any other protocol handler (mailto://, itunes://, etc) in that when it is installed, it registers itself with browsers/the system and is invoked that way.  The format for launching a session is very similar to how it's done for any other session joining method; via a client launch parameter string.

----------------Usage----------------

The arguments that are passed to the WindowsClient.exe process must look like:
protocol://relay_url:relay_port/sessionID/urlencoded_asymmetric_key/urlencoded_host_access_token/participant_name/session_type/application_title/client_launch_attributes/logon_sessionID

protocol, relay_url, relay_port, and urlencoded_asymmetric_key are constant per each instance of ScreenConnect.

sessionID, urlencoded_host_access_token, participant_name, session_type, application_title, client_launch_attributes, and _logon_sessionID are unique to each Session into which the connection attempt is being made and the Host attempting the connection.
