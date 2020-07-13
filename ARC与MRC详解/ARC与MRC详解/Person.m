//
//  Person.m
//  ARC与MRC详解
//
//  Created by 王天亮 on 2020/7/13.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id)test {
    id obj = [[NSObject alloc] init];
    return [obj autorelease];
}
- (void)dealloc {
    NSLog(@"delloc");
    [super dealloc];
}

@end
