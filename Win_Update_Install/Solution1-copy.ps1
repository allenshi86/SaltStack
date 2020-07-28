$PC = Get-Content("C:\scripts\computer_list.txt")

$i = 0

foreach ($h in $PC){

$i++
#防止日积月累下补丁文件目录过大，磁盘爆满
Invoke-Command -ComputerName $h  -ScriptBlock  { Remove-Item C:\hotfix -Force -Recurse }
Copy-Item -Path \\wj-ftp-svr01\share\hotfix  -Destination \\$h\C$\ -Force -Recurse

if ($h -eq $PC[-1]){
    Write-Progress -Activity "进度显示" -status "正在处理最后一台主机 $h !"
    Write-Output "总计处理 $i 台主机,传输完毕!"
    #Start-Sleep -Seconds 20
    #pause
}
else{
    Write-Progress -Activity "进度显示" -status "正在处理 第 $i 台主机 $h ,请耐心等待!"  -PercentComplete  ($i/$PC.count*100)
}

}
