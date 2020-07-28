#关闭防火墙
configure-firewall:
  win_firewall.disabled:
    - name: allprofiles
