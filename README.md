# salt-case

jinja模版需要sls文件里调用，而调用的可以是grains或者是pillar，假设是pillar，那么pillar文件也需要定义
注意，当定义了新的pillar文件需要对minion刷新pillar属性  
salt '*' saltutil.refresh_pillar #刷新pillar属性
salt '*' pillar.items #获取pillar属性
