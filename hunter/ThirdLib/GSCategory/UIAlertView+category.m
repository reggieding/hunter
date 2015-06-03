//
//  UIAlertView+category.m
//  96871
//
//  Created by zhangdd on 14-12-25.
//  Copyright (c) 2014年 zhangdd. All rights reserved.
//

#import "UIAlertView+category.h"

@implementation UIAlertView (category)
+(void)alert:(NSString*)title msg:(NSString*)msg
{
    if ([msg isEqualToString:@"NSURLErrorDomain"]) {
        msg=@"请确认是否联网.";
    }
    if([NSThread isMainThread]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
    });
}

+(void)alert:(NSString*)title msg:(NSString*)msg tag:(NSInteger)tag
{
    if ([msg isEqualToString:@"NSURLErrorDomain"]) {
        msg=@"请确认是否联网.";
    }
    if([NSThread isMainThread]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        alert.tag = tag;
        [alert show];
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        alert.tag = tag;
        [alert show];
    });
}

@end
