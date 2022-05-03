# Crontab排程 Linux排程設定

```markdown
#查看
crontab -l

#編輯
crontab -e

# ┌───────────── 分鐘   (0 - 59)
# │ ┌─────────── 小時   (0 - 23)
# │ │ ┌───────── 日     (1 - 31)
# │ │ │ ┌─────── 月     (1 - 12)
# │ │ │ │ ┌───── 星期幾 (0 - 7，0 是週日，6 是週六，7 也是週日)
# │ │ │ │ │
# * * * * * /path/to/command

crontab     0 3 1 * * /root/backupDB.sh
```

# Ex. 

```markdown

# 每月 5 日、25 日晚上 9 點 30 分各執行一次
30 21 5,25 * * /home/gtwang/script.sh --your --parameter
```
