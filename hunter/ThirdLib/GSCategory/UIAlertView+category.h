//
//  UIAlertView+category.h
//  96871
//
//  Created by zhangdd on 14-12-25.
//  Copyright (c) 2014年 zhangdd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (category)
+(void)alert:(NSString*)title msg:(NSString*)msg;
+(void)alert:(NSString*)title msg:(NSString*)msg tag:(NSInteger)tag;

@end