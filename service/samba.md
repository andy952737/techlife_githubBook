# Samba

# Samba Cloud 檔案管理
```
MAC連線方式：
設定 -> 檔案共享打開 -> 前往 -> 連接伺服器
smb://ip-addr
windows連線方式： 
\\host-ip\資料夾名稱\

Windows連線方式：
連線方式：
檔案總管 -> 找到 電腦 -> 連線網路磁碟機 -> 在資料夾路徑上key以下 -> 按完成輸入使用者及密碼

\\ip-addr\Public  (公開)

密碼：aotech2019

AO公開Samba使用者
\\ip-addr\xxx

sudo apt install tasksel
sudo tasksel install samba-server

sudo cp /etc/samba/smb.conf /etc/samba/smb.conf_backup
sudo bash -c 'grep -v -E "^#|^;" /etc/samba/smb.conf_backup | grep . > /etc/samba/smb.conf’

sudo smbpasswd -a linuxconfig
sudo nano /etc/samba/smb.conf

sudo mkdir /var/samba
sudo chmod 777 /var/samba/

sudo systemctl restart smbd
smbclient -L localhost

touch /var/samba/public-share
touch /home/linuxconfig/home-share

sudo systemctl status smbd

設定使用者權限：
path=/home/使用者目錄
browseable = yes
read only = yes
writable = yes
create mode = 0777
directory mode = 2770
valid users = ao   
```

# Remark
<http://linux.vbird.org/linux_server/0370samba.php>
<https://www.linuxbabe.com/ubuntu/install-samba-server-file-share>
<https://blog.xuite.net/skhung/digilife/36063437-%E5%A6%82%E4%BD%95%E5%9C%A8OSX%E4%B8%AD%E5%95%9F%E7%94%A8SMB%E9%80%A3%E7%B7%9A>