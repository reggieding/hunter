//
//  UILabel+category.h
//  96871
//
//  Created by zhangdd on 14-12-25.
//  Copyright (c) 2014年 zhangdd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (category)
-(id)initWithFrame:(CGRect)frame color:(UIColor*)color fontSize:(CGFloat)fontSize;
+(id)labelWithFrame:(CGRect)frame title:(NSString *)title fontSize:(CGFloat)fontSize color:(UIColor*)color;

@end
