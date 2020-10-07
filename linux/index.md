# Linux

#常用
```
ssh-add -K ~/.ssh/id_rsa
df -lh
ls -la

ssh設定:
ls -al ~/.ssh 
ssh-keygen -t rsa -C “username@example.com” 
輸入cat ~/.ssh/id_rsa.pub  
p.s. 把裡面的SSH Keys貼到GitLab Add an SSH Key上 
```

#use Select or debug:
```
grep -e "d 500" production.log 
grep -e "d 500" production.log -A 20 
grep -e "d 500" production.log -B 20 
grep -e "d 500" production.log -A 20 -B 20 
tail -f {production.log} 
```

# ssl 
```
建立openssl憑證:
sudo certbot --nginx -d DNS
```