//
//  main.m
//  ARC与MRC详解
//
//  Created by 王天亮 on 2020/7/13.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "NSObject+whenRetained.h"
#import "objc/runtime.h"
extern void _objc_autoreleasePoolPrint(void);

int main(int argc, const char * argv[]) {
    
    
//    NSObject *obj = [[NSObject alloc] init];
//    [obj release];
//
//}
//
    
    
    
    //ARC无效
   
    //这样并不会报错，虽然相当于多递减了对象，但是系统的自动释放池不知何时释放，此时后release，obj的引用计数应等于0，即将调用delloc方法。
    //当应用程序结束后，对象的delloc方法可能不会被调用，因为系统已经清理了当前程序进程的内存。
    
//    Person *person = [[Person alloc] init];
////    Person* obj  = [person test];
//
//    [person release];
   
    //查看delloc方法。当release后等于0后
    //当前类delloc方法是当前类的实例对象引用计数为0时才会调用，上面的例子中，obj实际指向的是NSObject类，所以执行的delloc方法是NSObject的。
//    Person *person = [[Person alloc] init];
//    [person autorelease];
//    [person release]; //自动释放池的释放时机不确定，这条release并不会报错。
    
//    @autoreleasepool {
//        Person *person = [[Person alloc] init];
//        [person autorelease];
//    } //右花括号结束，自动释放池块中调用autorelease的对象将会执行一次release。这个例子中的person会调用delloc方法。
//   NSLog(@"123");
    
//    retain并不可靠，执行力delloc仍然能够打印它的retainCount。
//    Person * person = [[Person alloc] init];
//    [person release];
//
//    NSLog(@"%ld", [person retainCount]);
    //ARC
    //有文档说这样会立即释放：【尽管在初始赋值之后使用了字符串，但在赋值时没有对字符串对象的其他强引用; 因此，它立即被释放。log 语句显示 string 的值为 null。（在这种情况下，编译器会提供警告。】
    //但事实并非如此，实际上和MRC的方法一样，
    
//    NSString *str = [NSString stringWithFormat:@"123"];
//    NSString * __weak string = [[NSString alloc] initWithFormat:@"First Name: %@", str];
//    NSLog(@"string: %@", string);
//
//生成并持有自己的autorelease池。
//    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
//    Person *person =[[Person alloc] init];
//    [person autorelease];
//    [pool drain];
    
    //arc有效
    //强引用对象会在超出变量作用域后自动释放
//    Person *person = [[Person alloc] init];
//    [person test];
    
    //自动赋值为nil
//    id __strong obj0 = nil;
//    id __weak obj1;
//    id __autoreleasing obj2;
//    NSLog(@"%@ %@ %@", obj0, obj1, obj2);
//  弱引用不持有对象，NSObject对象会被销毁。
// id __weak obj = [NSObject alloc] init];
    //obj持有对象，obj2弱引用对象obj。此时NSObject对象被obj强引用。
//    id __strong obj = [[NSObject alloc] init];
//    id __weak  obj2 = obj;
//    NSLog(@"%@", obj2);

    
    //如果不是以alloc/new/copy/mutableCopy开头的方法，就自动注册到释放池中
//    @autoreleasepool {
//        id obj = [NSMutableArray array];
//        NSLog(@"====%p", obj);
//    _objc_autoreleasePoolPrint();
//    }
    
    
////    例子1
//    id __weak obj1 = nil;
//        {
//            id  obj0 = [NSMutableArray array];
//            [obj0 addObject:[[Person alloc] init]];
//            obj1 = obj0;
//            NSLog(@"obj0 = %@", obj0);
//        }
//    _objc_autoreleasePoolPrint();
//        NSLog(@"obj1 = %@", obj1);
    
//    例子2
//    id __weak obj1 = nil;
//        {
//            id  obj0 = [[NSMutableArray alloc]init];
//            [obj0 addObject:@"obj"];
//            obj1 = obj0;
//            NSLog(@"obj0 = %@", obj0);
//        }
//            _objc_autoreleasePoolPrint();
//        NSLog(@"obj1 = %@", obj1);
  
//    例子
//                {
                // 书上说会跳过注册pool的步骤。
//                 id __strong obj0 = [NSMutableArray array];
                 //   NSLog(@"%p",obj0);
                // NSLog(@"%p", [NSMutableArray array]);
//                 id  obj1 = [NSMutableArray array];
//                 id  obj2 = [NSMutableArray array];
//                 id  obj3 = [NSMutableArray array];
//                  id  obj0 = [NSArray array];
//                  id  obj1 = [NSArray array];
//                  id  obj2 = [NSArray array];
//                  id  obj3 = [NSArray array];
       // _objc_autoreleasePoolPrint();
//             }
//        _objc_autoreleasePoolPrint();

    
    
   // 使用weak变量或者将weak变量赋值给其他对象会注册到pool ARC无效时
    NSObject *obj = [[NSObject alloc] init];
    id __weak weakObj = obj;
    NSLog(@"%@", weakObj);
    NSLog(@"%@", weakObj);
    NSLog(@"%@", weakObj);
    NSLog(@"%@", weakObj);
     _objc_autoreleasePoolPrint();
//    id obj = [[NSObject alloc] init];
    //NSLog(@"obj0=%d", _objc_rootRetainCount(weakObj));
   

    return 0;
}
