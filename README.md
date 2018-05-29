# react-native-pantest


# 创建podspec文件
创建podspec文件，执行 $ pod spec create XXX    其中XXX为组件名;

打tag：因为cocoapods是依赖tag版本的，所以必须打tag，以后再次更新只需要把你的项目打一个tag，
然后修改.podspec文件中的版本
$ git tag "1.0.0"   //为git打tag，第一次需要在前面加一个v
$  git push --tags  //将tag推送到远程仓库


验证podspec文件：验证此文件是否可用，不允许有任何的Warning或者Error
命令行：pod lib lint    //验证podspec文件是否可正常使用
执行命令：pod spec lint  XXX.podspec --verbose

报错：

    1.fatal: Remote branch 1.0.0 not found in upstream origin:
    
      这是因为在编辑 XXX.podspec 时, 里面的字段 s.verson, s.source 中的 tag与github创建的release版本号不一致导致, 修改为一样即可;
      
    2.[iOS] file patterns: The `source_files` pattern did not match any file:
    
      这个是在指定共享的类库时, 文件路径不对, 也就是设置s.source_files 字段时, 发生了错误;
            
     3.加载xib问题:如果通过cocoapods下载的类库中含有Xib文件, 
       使用原来的方式初始化就不起作用了:
            [[[NSBundle mainBundle] loadNibNamed:@"xibName" owner:self options:nil] lastObject];
            [self.collectionView registerNib:[UINib nibWithNibName:@"xibName" bundle:nil] forCellWithReuseIdentifier:@"ZLCollectionCell"];
           
       应该使用下面这种方式初始化:
           #define kZLPhotoBrowserBundle [NSBundle bundleForClass:[self class]]
           [[kZLPhotoBrowserBundle loadNibNamed:@"ZLPhotoActionSheet" owner:self options:nil] lastObject];
           [self.collectionView registerNib:[UINib nibWithNibName:@"ZLCollectionCell" bundle:kZLPhotoBrowserBundle] forCellWithReuseIdentifier:@"ZLCollectionCell"];
           

扩展:通过Trunk推送给Cocoapods服务器：
        首先向trunk服务器查询自己的注册信息 $ pod trunk me
        
      注册：pod trunk register 邮箱  ‘用户名’  --verbose
        
      最后通过终端push对应的podspec：$ pod trunk push XXX.podspec
        
        
//必要属性

podspec文件中参数说明：

s.name :    名称，pod search 搜索的关键词,注意这里一定要和.podspec的名称一样,否则报错

s.version：版本号

s.summary: 简单描述

s.homepage: 项目的getub地址，只支持HTTP和HTTPS地址，不支持ssh的地址

s.license：项目遵守的协议；#s.license = { :type => 'MIT', :file => 'LICENSE' }

s.author：作者和邮箱

s.source：git仓库的https地址

s.requires_arc：是否要求arc

s.source_files：表示源文件的路径，这个路径是相对podspec文件而言的

                s.source_files ='AppInfo'   //下载AppInfo文件夹下的所有文件，子文件夹不识别

                s.source_files ='AppInfo/*.*'   //下载AppInfo目录下所有格式文件
                
                s.source_files = 'AppInfo/**/*' //**/*表示Classes目录及其子目录下所有文件
                
                “*” 表示匹配所有文件
                
                “*.{h,m}” 表示匹配所有以.h和.m结尾的文件
                
                “**” 表示匹配所有子目录

//可选属性

s.description :详细描述

s.public_header_files：在这个属性中声明过的.h文件能够使用<>方法联想调用

s.frameworks：需要用到的frameworks，不需要加.frameworks后缀

s.platform ：支持的平台及版本

s.ios.deployment_target：低要求的系统版本

s.dependency：依赖关系，该项目所依赖的其他库

s.resource_bundles：动态库所使用的资源文件存放位置，放在Resources文件夹中

s.subspec 'Info' do |ss| ：建立名称为Info的子文件夹（虚拟路径）


附录：清理本地spec文件缓存

$  pod cache list   //查看所有spec文件的缓存，可以直接到路径下删除文件

$  pod cache clean AFNetworking    //删除指定库的缓存文件

$  pod install --no-repo-update    //运行podfile文件但不更新本地spec文件


















