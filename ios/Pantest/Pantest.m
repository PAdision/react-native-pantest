//
//  Pantest.m
//  Pantest
//
//  Created by os on 2018/4/10.
//  Copyright © 2018年 os. All rights reserved.
//

#import "Pantest.h"
#import "RCTLog.h"

@implementation Pantest

RCT_EXPORT_MODULE(Pantest);

//测试方法导出
RCT_EXPORT_METHOD(testPrint:(NSString*)name info:(NSDictionary*)info{
    RCTLogInfo(@"%@:%@",name,info);
})
@end
