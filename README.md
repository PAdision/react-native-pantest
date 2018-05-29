# react-native-pantest

创建podspec文件，执行 $ pod spec create XXX    其中XXX为组件名;


打tag：因为cocoapods是依赖tag版本的，所以必须打tag，以后再次更新只需要把你的项目打一个tag，
然后修改.podspec文件中的版本
$ git tag "v1.0.0"   //为git打tag，第一次需要在前面加一个v
$  git push --tags  //将tag推送到远程仓库


验证podspec文件：验证此文件是否可用，不允许有任何的Warning或者Error
执行命令：pod spec lint  XXX.podspec --verbose


扩展:通过Trunk推送给Cocoapods服务器：首先向trunk服务器查询自己的注册信息 $ pod trunk me
        注册：pod trunk register 邮箱  ‘用户名’  --verbose
        最后通过终端push对应的podspec：$ pod trunk push XXX.podspec
