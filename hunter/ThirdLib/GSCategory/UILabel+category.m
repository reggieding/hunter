//
//  UILabel+category.m
//  96871
//
//  Created by zhangdd on 14-12-25.
//  Copyright (c) 2014年 zhangdd. All rights reserved.
//

#import "UILabel+category.h"

@implementation UILabel (category)


+(id)labelWithFrame:(CGRect)frame title:(NSString *)title fontSize:(CGFloat)fontSize color:(UIColor*)color
{
    UILabel* label = [[self alloc]initWithFrame:frame];
    label.text = title;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.backgroundColor = [UIColor clearColor];
    
    return label;
}

-(id)initWithFrame:(CGRect)frame color:(UIColor*)color fontSize:(CGFloat)fontSize;
{
    self = [super initWithFrame:frame];
    if (self) {
        self.textColor = color;
        self.font = [UIFont systemFontOfSize:fontSize];
    }
    
    return self;
}

@end
