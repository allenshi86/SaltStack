#清除默认网关
clear-gateway:
  cmd.script:
    - name: set_netroute.ps1
    - source: salt://scripts/Deny_Server_Access_InterNet/set_netroute.ps1
    - shell: powershell
