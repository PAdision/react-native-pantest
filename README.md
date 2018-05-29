# react-native-pantest

创建podspec文件，执行 $ pod spec create XXX    其中XXX为组件名;


打tag：因为cocoapods是依赖tag版本的，所以必须打tag，以后再次更新只需要把你的项目打一个tag，
然后修改.podspec文件中的版本
$ git tag "1.0.0"   //为git打tag，第一次需要在前面加一个v
$  git push --tags  //将tag推送到远程仓库


验证podspec文件：验证此文件是否可用，不允许有任何的Warning或者Error
执行命令：pod spec lint  XXX.podspec --verbose

报错：1.fatal: Remote branch 1.0.0 not found in upstream origin
              这是因为在编辑 XXX.podspec 时, 里面的字段 s.verson, s.source 中的 tag与github创建的release版本号不一致导致, 修改为一样即可!
           2.[iOS] file patterns: The `source_files` pattern did not match any file.
           

扩展:通过Trunk推送给Cocoapods服务器：首先向trunk服务器查询自己的注册信息 $ pod trunk me
        注册：pod trunk register 邮箱  ‘用户名’  --verbose
        最后通过终端push对应的podspec：$ pod trunk push XXX.podspec
