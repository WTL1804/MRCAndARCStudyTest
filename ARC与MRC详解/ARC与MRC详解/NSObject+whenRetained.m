//
//  NSObject+whenRetained.m
//  ARC与MRC详解
//
//  Created by 王天亮 on 2020/7/14.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "NSObject+whenRetained.h"
#import <objc/runtime.h>
@implementation NSObject (whenRetained)
//- (void)swizzle {
//     NSLog(@"123");
//    [self swizzle];
////    NSLog(@"123");
//}
//+ (void)load {
//    Class class = [self class];
//              // 原方法名 和 替换方法名
//              SEL originalSelector = @selector(release);
//              SEL swizzledSelector = @selector(swizzle);
//              // 原方法结构体 和 替换方法结构体
//              Method originalMethod = class_getInstanceMethod(class, originalSelector);
//              Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
//        BOOL didAddMethod = class_addMethod(class,
//                                              originalSelector,
//                                              method_getImplementation(swizzledMethod),
//                                              method_getTypeEncoding(swizzledMethod));
//          if (didAddMethod) {
//              // 原方法的 IMP 添加成功后，修改 替换方法的 IMP 为 原始方法的 IMP
//              class_replaceMethod(class,
//                                  swizzledSelector,
//                                  method_getImplementation(originalMethod),
//                                  method_getTypeEncoding(originalMethod));
//          } else {
//              // 添加失败（说明已包含原方法的 IMP），调用交换两个方法的实现
//              method_exchangeImplementations(originalMethod, swizzledMethod);
//          }
//}
@end
