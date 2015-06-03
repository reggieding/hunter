//
//  GSUtil.h
//  hc96871
//
//  Created by zhangdd on 15-1-12.
//  Copyright (c) 2015年 HC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSUtil : NSObject
+ (UIImage *)imageFromColor:(UIColor *)color andSize:(CGSize)size radious:(CGFloat)radious;
+ (BOOL)isJailbroken;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
+ (UIImage *)buttonImageFromColor:(UIColor *)color andSize:(CGSize)size;

@end
