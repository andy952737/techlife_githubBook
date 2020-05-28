# use Git
> 工程師必備工具之一 git

# install
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git
``` 

# 新增或初始
> https://gitbook.tw/chapters/using-git/init-repository.html
```
//輸入完git init 後會出現git資料夾
.git

git repository
 
//更換遠端git資源庫，使用 git remote set-url
git remote -v 
git remote set-url origin https://github.com/USERNAME/OTHERREPOSITORY.git
git remote set-url origin git@github.com:USERNAME/OTHERREPOSITORY.git

```

# git指令
> https://backlog.com/git-tutorial/tw/reference/config.html
```
git branch
git branch {建立分支}
git branch -d {分支名稱}
git checkout {看要切換哪個分支}
P.s. 預設最大是 master

//合併分支
git merge

git remote -v
git remote remove origin 

git clone {專案.git_url}
git pull

git init
git add {選擇檔案} 或 直接 . 
git common -m '自己描述’
git push -u origin {定義分支} 如果不打 -u 之後，則是以現在的分支 push

```

# 特殊狀況
```
git config --global user.email "ex@mail.com"   
git remote set-url origin  https://github.com/username/project.git
```

# GitLab
```
根目錄ssh設定
ls -al ~/.ssh
ssh-keygen -t rsa -C “ex@mail.com”

#取得SSH Keys
輸入cat ~/.ssh/id_rsa.pub 

把裡面的SSH Keys貼到GitLab Add an SSH Key上

設定遠端ssh快速登入
vim authorized_keys 把本地(自己)電腦的ssh key放到authorized_keys裡面
cat authorized_keys

```

# Git heroku
<https://devcenter.heroku.com/articles/heroku-cli#download-and-install>
```
heroku update
heroku git:remote -a { project_name }
heroku git:clone -a APP-NAME
heroku slugs:download -a APP-NAME
heroku create XXX     
heroku rename          

heroku git:remote -a YourAppName
touch composer.json 

git add .  
git commit -am “xxxx”
git push heroku master

heroku run rails db:create
heroku run rails db:migrate
heroku run rails db:seed
heroku pg:reset
heroku open
```

# Gitlab建立ssh
<https://codertw.com/%E7%A8%8B%E5%BC%8F%E8%AA%9E%E8%A8%80/536438/>