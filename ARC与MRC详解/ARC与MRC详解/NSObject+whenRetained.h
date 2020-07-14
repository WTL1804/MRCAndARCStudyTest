//
//  NSObject+whenRetained.h
//  ARC与MRC详解
//
//  Created by 王天亮 on 2020/7/14.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (whenRetained)
- (void)swizzle;
@end

NS_ASSUME_NONNULL_END
