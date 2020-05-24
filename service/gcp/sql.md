# GCP Cloud SQL

```
> sudo service sshd restart
> sudo service nginx restart

記得改 port 再執行以下指令: 

./cloud_sql_proxy -instances=my-project-123456:asia-east1:project=tcp:5440 \ -credential_file=gcp_api_key.json &
```