git status
git pull
git merge origin/test 

if [ ! -n "$1" ]; then
    echo "you have not input a srv common!"
    exit 0
else
    echo "确认分支信息 ..."
fi

echo "回车之后更新并且提交 运行服务? "
read answer
git pull

if [  -n "$1" ];then
git add .
git commit -m "更新细节:$1"
fi

git push  origin testhashma

