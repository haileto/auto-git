#更新最近50次提交的文件
update_file_times=80
auth="hashma"
merge_from="master"
update_from="testhashma"
git pull
#合并源分支 ，更新自己的分支代码 保持最新的姿势
git merge origin/${merge_from}
#将log写入文件 | 去掉空行 | 排序 | 删除重复的行
#从某个环境的分支获取最新的文件合并到当前分支
git log origin/${update_from} --pretty=format:"" --name-only --author="${auth}" -${update_file_times} | sed '/^$/d' | sort -k2n | sed '$!N; /^\(.*\)\n\1$/!P; D' >/tmp/${auth}.gitlog.txt
cat /tmp/${auth}.gitlog.txt | while read line; do
    git checkout origin/${update_from} $line
done

git status
echo "回车之后更新并且提交click enter to continue commit and push ? "
