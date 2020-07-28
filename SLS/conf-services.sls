#启用开机自启
enable-boot-services:
  service.enabled:
   - name: w32Time
#禁用开机自启
disable-boot-services:
  service.disabled:
    - name: w32Time 
#启服
start-services:
  service.running:
    - names:
      - w32Time
      - wuauserv
#停服   
stop-services:
  service.dead:
    - names:
      - w32Time
      - wuauserv
