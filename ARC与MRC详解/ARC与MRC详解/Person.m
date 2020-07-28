//
//  Person.m
//  ARC与MRC详解
//
//  Created by 王天亮 on 2020/7/13.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "Person.h"

@implementation Person

//arc无效
//- (id)test {
//    id obj = [[NSObject alloc] init];
//    return [obj autorelease];
//}
//- (void)dealloc {
//    NSLog(@"delloc");
//    [super dealloc];
//}

//arc有效

+ (id)test {
    ////强引用对象会在超出变量作用域后自动释放
    id obj = [[NSObject alloc] init];
    return obj;
}
+ (id)ttttt {
    id obj = [[self alloc] init];
       return obj;
}

- (void)dealloc {
    NSLog(@"delloc");
}
+ (id)alloTest {
    
    return [[NSMutableArray alloc] init];
}
@end
