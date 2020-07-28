#服务器封网：

$IPSubNet='10.0.0.0','172.16.0.0','172.17.0.0','172.18.0.0','172.19.0.0','172.20.0.0','172.21.0.0','172.27.0.0','172.29.0.0'
$tmp = Get-NetRoute -DestinationPrefix 0.0.0.0/0 
$gw = $tmp.NextHop

foreach ($i in $IPSubNet) {

     if($i -eq  "10.0.0.0") {

         route add $i mask 255.0.0.0 $gw -p
     }
     else
     {
      
         route add $i mask 255.255.0.0 $gw -p
     }

}

route delete 0.0.0.0 
