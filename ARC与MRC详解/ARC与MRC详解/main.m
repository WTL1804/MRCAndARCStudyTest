//
//  main.m
//  ARC与MRC详解
//
//  Created by 王天亮 on 2020/7/13.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
   
    //这样并不会报错，虽然相当于多递减了对象，但是系统的自动释放池不知何时释放，此时后release，obj的引用计数应等于0，即将调用delloc方法。
    //当应用程序结束后，对象的delloc方法可能不会被调用，因为系统已经清理了当前程序进程的内存。
//    Person *person = [[Person alloc] init];
//    Person* obj  = [person test];
//    [obj release];
   
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
    
    
    //ARC
    //有文档说这样会立即释放：【尽管在初始赋值之后使用了字符串，但在赋值时没有对字符串对象的其他强引用; 因此，它立即被释放。log 语句显示 string 的值为 null。（在这种情况下，编译器会提供警告。】
    //但事实并非如此，实际上和MRC的方法一样，
    
    NSString *str = [NSString stringWithFormat:@"123"];
    NSString * __weak string = [[NSString alloc] initWithFormat:@"First Name: %@", str];
    NSLog(@"string: %@", string);
    
    
    return 0;
}
